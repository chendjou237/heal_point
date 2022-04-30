import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heal_point/screens/screens.dart';
import 'package:heal_point/utilities/palette.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toast/toast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/models.dart';
import '../providers/providers.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth;
  final Reader _read;
  Authentication(this._firebaseAuth, this._read);

  //sign up the user and store his data to firestore
  Future<void> signupUser({
    required String mail,
    required String pass,
    required Patient patient,
    required BuildContext context,
  }) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: mail, password: pass)
          .then((response) async {
        if (await _read(databaseProvider).createPatient(
            patient.copyWith(id: response.user?.uid ?? "no id"))) {
          // Toast.show("Successful signed up",
          // duration: Toast.lengthShort, backgroundColor: successColor);
          Navigator.pushNamed(context, '/phone_verification');
        }
        // Toast.show("error while signing up",
        //     duration: Toast.lengthShort, backgroundColor: errorColor);
      });
    } on FirebaseAuthException catch (err) {
      // Toast.show(
      //   err.message ?? "Something went wrong !",
      //   backgroundColor: errorColor,
      //   duration: Toast.lengthShort,
      // );
    }
  }

  //track the state of authentication by a real-time listener
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<bool> verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);
    try {
      await _read(firebaseAuthProvider)
          .currentUser
          ?.updatePhoneNumber(credential);
      // Navigator.pushNamed(context, "/heal");
      _read(patientControllerProvider.notifier)
          .state
          .copyWith(phoneNumber: _read(phoneProvider.state).state);
      return true;
    } on FirebaseException catch (e) {
      print("this is the message return by firebase: ${e.message}");
      return false;
    }
  }

  Future<bool> loginWithPhone(String phoneNumber, BuildContext context) async {
    bool response = false;
    print("The number to be input is $phoneNumber");
    _read(firebaseAuthProvider).verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        response = true;
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        _read(otpVisibilityProvider.state).state = true;
        // otpVisibility = true;
        verificationID = verificationId;
        // setState(() {});
        response = true;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return response;
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      final userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (await _read(firebaseDbProvider)
          .collection('patients')
          .doc(userCred.user?.uid)
          .get()
          .then((value) => value.exists)) {
        await _read(databaseProvider).getPatient(userCred.user!.uid );
        Navigator.of(context).pushNamed( "/");
      }

      await _read(databaseProvider).createPatient(Patient(
          id: userCred.user?.uid ?? "no id provided",
          phoneNumber: userCred.user?.phoneNumber ?? "0000",
          names: userCred.user?.displayName ?? "unknown",
          email: userCred.user?.email ?? "undefined"));
      Navigator.of(context).pushNamed( "/");
    } on FirebaseAuthException catch (e) {
      throw e.message ?? e.toString();
    }

    // Once signed in, return the UserCredential
  }

  Future<void> signOut(BuildContext context) async {
    bool result = false;
    // ToastContext().init(context);

    try {
      await _read(firebaseAuthProvider).signOut();
      await GoogleSignIn().signOut();
      // Toast.show(
      //   'Signed out',
      //   duration: 3,
      // );
      result = true;
      Navigator.of(context).pushNamed("/sign_up");
    } on FirebaseException catch (e) {
      result = false;
      print(e.message);
      // Navigator.pushNamed(context, "/sign_in");
    }
  }
}
