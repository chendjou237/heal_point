import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toast/toast.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../utilities/utilities.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  final Reader _read;
  Database(this._read);
  Future<bool> createPatient(Patient patient) async {
    bool result = false;
    try {
      await _firestore.collection('patients').add(patient.toMap());

      Toast.show('Patient created', duration: Toast.lengthLong);
      result = true;
      return result;
    } on FirebaseException catch (e) {
      result = false;
      Toast.show(e.message ?? "Something went wrong",
          duration: Toast.lengthLong);
      return result;
    }
  }

  bool getPatient(String uid) {
    try {
      _firestore
          .collection('patients')
          .doc(uid)
          .get(GetOptions(source: Source.serverAndCache))
          .then((doc) {
        Patient _patient = Patient.fromMap(doc.data());
        _read(patientControllerProvider.notifier).data = _patient;
      });
      return true;
    } on FirebaseException catch (err) {
      Toast.show(
        "Fetching error:  ${err.message} ?? ",
        backgroundColor: errorColor,
        duration: Toast.lengthLong,
      );
      return false;
    }
  }
}
