import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';
import '../providers/providers.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  final Reader _read;
  Database(this._read);
  Future<bool> createPatient(Patient patient) async {
    bool result = false;
    try {
      await _firestore
          .collection('patients')
          .doc(patient.id)
          .set(patient.toMap());
      _read(patientControllerProvider.notifier).data = patient;
      print(
          "ON creation succeed ${_read(patientControllerProvider.notifier).state.toString()} ");
      // Toast.show('Patient created', duration: Toast.lengthLong);
      result = true;
      return result;
    } on FirebaseException {
      result = false;
      // Toast.show(e.message ?? "Something went wrong",
      //     duration: Toast.lengthLong);
      return result;
    }
  }
  
  Future<bool> getHealthCenters(List<String> hids) async {
    try {
      for (var id in hids)  {
        await _firestore
            .collection('hospitals')
            .doc(id)
            .get(const GetOptions(source: Source.serverAndCache))
            .then((value) {
          List<HealthCenter> newList =
              _read(healthCentersControllerProvider.notifier).state;
          newList.add(HealthCenter.fromMap(value.data()!));
          _read(healthCentersControllerProvider.notifier).state = newList;
        });
      }
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }
  Future<bool> getDrugs(List<String> dids) async {
    try {
      for (var id in dids)  {
        await _firestore
            .collection('drugs')
            .doc(id)
            .get(const GetOptions(source: Source.serverAndCache))
            .then((value) {
          List<Drug> newList =
              _read(drugsControllerProvider.notifier).state;
          newList.add(Drug.fromMap(value.data()!));
          _read(drugsControllerProvider.notifier).state = newList;
        });
      }
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> getPatient(String uid) async {
    try {
      await _firestore
          .collection('patients')
          .doc(uid)
          .get(const GetOptions(source: Source.serverAndCache))
          .then((doc) {
        Patient _patient = Patient.fromMap(doc.data());
        _patient = _patient.copyWith(id: uid);

        _read(patientControllerProvider.notifier).state = _patient;
        print(
            "in database ${_read(patientControllerProvider.notifier).state.toString()}");
      });
      return true;
    } on FirebaseException catch (err) {
      print(err.message ?? err.toString());
      return false;
    }
  }
}
