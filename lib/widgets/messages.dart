// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utilities/utilities.dart';

class Messages extends ConsumerStatefulWidget {
  const Messages({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MessagesState();
}

class _MessagesState extends ConsumerState<Messages> {
  @override
  Widget build(BuildContext context) {
    final _patient = ref.read(patientControllerProvider);
    Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
        .collection('chat_rooms').doc(_patient.id)
        .collection('messages')
        .orderBy('time')
        .snapshots();
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
                crossAxisAlignment: _patient.email == qs['sender_email']
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    width: 300,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: secondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        qs['sender_email'],
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              qs['message'],
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            d.hour.toString() + ":" + d.minute.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
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
