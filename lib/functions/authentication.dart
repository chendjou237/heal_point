import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toast/toast.dart';

import '../providers/providers.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth;
  final Reader _read;
  Authentication(this._firebaseAuth, this._read);

  //track the state of authentication by a real-time listener
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
// Future<bool> verifyOTP() async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationID, smsCode: otpController.text);
//     try {
//       await _read(firebaseAuthProvider).signInWithCredential(credential).then(
//         (value) {
//           print("You are logged in successfully");

//           Toast.show(
//             "You are logged in successfully",
//             backgroundColor: Colors.green,
//             duration: Toast.lengthShort,
//           );
//         },
//       );
//       return true;
//     } on FirebaseException catch (e) {
//       print("this is the message return by firebase: ${e.message}");
//       return false;
//     }
//   }


//   Future<bool> loginWithPhone(String phoneNumber, BuildContext context) async {
//     bool response = false;
//     print("The number to be input is $phoneNumber");
//     _read(firebaseAuthProvider).verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await  _read(firebaseAuthProvider).signInWithCredential(credential);
//         Navigator.pushNamed(context, "/password");
//         response = true;
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print(e.message);
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         otpVisibility = true;
//         verificationID = verificationId;
//         setState(() {});
//         response = true;
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//     return response;
//   }
  Future<bool> signOut(BuildContext context) async {
    bool result = false;

    try {
      await _read(firebaseAuthProvider).signOut();
      Toast.show(
        'Signed out',
        duration: 3,
      );
      result = true;
      return result;
    } on FirebaseException catch (e) {
      result = false;
      print(e.message);
      return result;
    }
  }
}
