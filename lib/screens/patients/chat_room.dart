// ignore_for_file: must_be_immutable, unused_field, prefer_final_fields, avoid_print

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import '../../widgets/widgets.dart';

class ChatRoomPage extends ConsumerStatefulWidget {
  int timeLeft;
  ChatRoomPage({
    Key? key,
    required this.timeLeft,
  }) : super(key: key);
  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends ConsumerState<ChatRoomPage> {
  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = TextEditingController();
  Timer? _timer;
  int _start = 10000;

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.timeLeft > 0) {
          widget.timeLeft -= 1000;
        } else {
          timer.cancel();
          ref
              .read(databaseProvider)
              .closeSession(ref.read(patientControllerProvider).id!);
          context.popRoute();
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _patient = ref.read(patientControllerProvider);
    print(_patient.names);
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          " ${15000 > 0 ? DateTime.fromMillisecondsSinceEpoch(15000).toString() : 'Time Over'}",
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              _auth.signOut().whenComplete(() {});
            },
            child: const Text(
              "Book Appointment",
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
              child: const Messages(),
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
                          'type': 'patient',
                          'sender_email': _patient.email.trim(),
                        });

                      message.clear();
                    }
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
