// import 'package:flutter/material.dart';
// import 'package:heal_point/utilities/palette.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:auto_route/auto_route.dart';

// class ChatRoomPage extends ConsumerStatefulWidget {
//   const ChatRoomPage({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _ChatRoomPageState();
// }

// class _ChatRoomPageState extends ConsumerState<ChatRoomPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: secondaryColorLight,
//         title: Text("Chat Room"),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => context.router.pop(context),
//         ),
//       ),
//       body: Container(
//         child: Column(
//          children: [const SingleChildScrollView(

//             child: Center(
//          child:     Text("No Discussion Yet"),
//             ),
//           ),
//           Row(
//             children: [
//            const   TextField(
//                 decoration: InputDecoration(
//                   hintText: "What's your question?",
//                 ),
//               ),
//               IconButton(
//                   icon:const Icon(Icons.send),
//                   onPressed: () {},
//               ),
//             ],
//           ),
//          ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:heal_point/providers/ui_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/widgets.dart';

class ChatRoomPage extends ConsumerStatefulWidget {
  const ChatRoomPage({Key? key}) : super(key: key);
  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends ConsumerState<ChatRoomPage> {
  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _doctor = ref.read(selectedDoctorProvider);
    final _patient = ref.read(patientControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'data',
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              _auth.signOut().whenComplete(() {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Home(),
                //   ),
                // );
              });
            },
            child: const Text(
              "signOut",
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
                  onPressed: () {
                    if (message.text.isNotEmpty) {
                      fs.collection('Messages').doc().set({
                        'message': message.text.trim(),
                        'time': DateTime.now(),
                        'receiver_email': _doctor.email,
                        'sender_email':_patient.email,
                      });
                      fs.collection('chat_room').doc().set({
                        'last_message': message.text.trim(),
                        // 'time': DateTime.now(),
                        
                        'doctor_email': _doctor.email,
                        'patient_email':_patient.email,
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
