import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/widgets.dart';

class DoctorChatRoomPage extends ConsumerStatefulWidget {
  const DoctorChatRoomPage({Key? key}) : super(key: key);
  @override
  _DoctorChatRoomPageState createState() => _DoctorChatRoomPageState();
}

class _DoctorChatRoomPageState extends ConsumerState<DoctorChatRoomPage> {
  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _patient = ref.read(patientControllerProvider);
    final _doctor = ref.read(doctorControllerProvider);
    final _db = ref.read(databaseProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'data',
        ),
        actions: [
          MaterialButton(
            onPressed: () async {
              await _auth.signOut().whenComplete(() async {
                if (await _db.closeSession(_patient.id!)) {
                  context.popRoute();
                } else {
                  log('the close session was unsuccessful');
                }
              });
            },
            child: const Text(
              "close chat",
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.79,
              child: DoctorMessages(),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: message,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple[100],
                      hintText: 'message',
                      enabled: true,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (value) {
                      message.text = value!;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    bool status = true;
                    await fs
                        .collection('chat_rooms')
                        .doc(_patient.id)
                        .get()
                        .then((value) =>
                            status = value.data()!['status'] == 'active');
                    if (message.text.isNotEmpty && status) {
                      fs.collection('chat_rooms').doc(_patient.id)
                        ..set({
                          'last_message': message.text.trim(),
                          'status': 'active',
                          'patient_id': _patient.id,
                          'patient_names': _patient.names,
                          'patient_email': _patient.email,
                          'time':
                              DateTime.now().millisecondsSinceEpoch.toString(),
                        })
                        ..collection('messages').doc().set({
                          'message': message.text.trim(),
                          'time': DateTime.now(),
                          'type': 'doctor',
                          'sender_email': _doctor.email.trim(),
                        });

                      message.clear();
                    } else
                      print("The session is no more available");
                  },
                  icon: const Icon(Icons.send_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
