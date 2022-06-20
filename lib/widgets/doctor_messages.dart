// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:heal_point/providers/providers.dart';

//import '../models/models.dart';

class DoctorMessages extends ConsumerStatefulWidget {
 
   const DoctorMessages({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoctorMessagesState();
}

class _DoctorMessagesState extends ConsumerState<DoctorMessages> {
  @override
  Widget build(BuildContext context) {
    final _doctor = ref.read(doctorControllerProvider);
    final _patient = ref.read(patientControllerProvider);
    Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(_patient.id)
        .collection('messages')
        .orderBy('time')
        .snapshots();
        // final _doctor = ref.read(doctorControllerProvider);
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemBuilder: (_, index) {
            QueryDocumentSnapshot qs = snapshot.data!.docs[index];
            Timestamp t = qs['time'];
            DateTime d = t.toDate();
            print(d.toString());
            return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: _doctor.email == qs['sender_email']
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: _doctor.email == qs['sender_email']
                          ? Colors.purple[100]
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 300,
                    child: ListTile(

                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.purple,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        qs['sender_email'],
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              qs['message'],
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Text(
                            d.hour.toString() + ":" + d.minute.toString(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
