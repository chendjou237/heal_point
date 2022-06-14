// ignore_for_file: avoid_print, invalid_use_of_protected_member, avoid_function_literals_in_foreach_calls, unused_local_variable

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
  Future<bool> createNurseOrder(NurseOrder order) async {
    bool result = false;
    try {
      await _firestore
          .collection('nurse_orders')
          .doc()
          .set(order.toMap());
      // _read(patientControllerProvider.notifier).data = patient;
      print(
          "ON creation succeed order created successfully");
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

  Future<bool> getHealthCenters() async {
    try {
      await _firestore
          .collection('hospitals')
          .get(const GetOptions(source: Source.serverAndCache))
          .then((value) {
        value.docs.forEach((element) {
          List<HealthCenter> healthCenters = [];
          healthCenters.add(HealthCenter.fromMap(element.data()));
          _read(healthCentersControllerProvider.notifier).data = healthCenters;
        });
      });
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> getDrugs(List<String> dids) async {
    try {
      for (var id in dids) {
        await _firestore
            .collection('drugs')
            .get(const GetOptions(source: Source.serverAndCache))
            .then((value) => value.docs.forEach((element) {
                  List<Drug> newList =
                      _read(drugsControllerProvider.notifier).state;
                  newList.add(Drug.fromMap(element.data()));
                  _read(drugsControllerProvider.notifier).state = newList;
                }));
      }
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> getPatients() async {
    try {
      await _firestore
          .collection('chat_room').where('doctor_email', isEqualTo: _read(doctorControllerProvider).email)
          .get(const GetOptions(source: Source.serverAndCache))
          .then((value) {
        value.docs.forEach((element) {
          List<Patient> patients = [];
          patients.add(Patient.fromMap(element.data()));
          _read(patientsControllerProvider.notifier).data = patients;
        });
      });
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> getDocs() async {
    try {
      await _firestore
          .collection('doctors')
          .get(const GetOptions(source: Source.serverAndCache))
          .then((value) {
        value.docs.forEach((element) {
          List<Doctor> doctors = [];
          doctors.add(Doctor.fromMap(element.data()));
          _read(doctorsControllerProvider.notifier).data = doctors;
        });
      });
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }
  Future<bool> getPatientChats() async {
    try {
      List<ChatRoom> rooms = [];
      await _firestore
          .collection('chat_rooms').where('status',isEqualTo: 'active')
          .get(const GetOptions(source: Source.serverAndCache))
          .then((value) {
        value.docs.forEach((element) {
          
          rooms.add(ChatRoom.fromMap(element.data()));
        });
          _read(chatRoomProvider.state).state = rooms;
      });
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }
  Future<bool> getGeneralOrders() async {
    try {
      List<NurseOrder> orders = [];
      await _firestore
          .collection('nurse_orders')
          .get(const GetOptions(source: Source.serverAndCache))
          .then((value) {
        value.docs.forEach((element) {
          
          orders.add(NurseOrder.fromMap(element.data()));
        });
          _read(listOrdersControllerProvider.notifier).state = orders;
      });
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> patientDbInitializer(String uid) async {
    try {
      await getPatient(uid);
      await getDocs();
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }
  Future<bool> doctorDbInitializer(String uid) async {
    try {
      await getDoc(uid);
      await getPatientChats();
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }
  Future<bool> nurseDbInitializer(String uid) async {
    try {
      await getNurse(uid);
      await getGeneralOrders();
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

  Future<bool> closeSession(String sessionId)async{
    try{
      await _firestore.collection('chat_room').doc(sessionId).update({
        'status': 'closed'
      });
      _read(sessionStatusProvider.state).state = false;
      return true;
    }
    on FirebaseException catch(error) {
      print(error.message);
      return false;
    }
  }

  Future<bool> getDoc(String uid) async {
    try {
      await _firestore
          .collection('doctors')
          .doc(uid)
          .get(const GetOptions(source: Source.serverAndCache))
          .then((doc) {
        Doctor _doc = Doctor.fromMap(doc.data());
        _doc = _doc.copyWith(id: uid);

        _read(doctorControllerProvider.notifier).state = _doc;
        print(
            "in database ${_read(doctorControllerProvider.notifier).state.toString()}");
      });
      return true;
    } on FirebaseException catch (err) {
      print(err.message ?? err.toString());
      return false;
    }
  }
  Future<bool> getNurse(String uid) async {
    try {
      await _firestore
          .collection('nurse')
          .doc(uid)
          .get(const GetOptions(source: Source.serverAndCache))
          .then((nurse) {
        Doctor _nurse = Doctor.fromMap(nurse.data());
        _nurse = _nurse.copyWith(id: uid);

        _read(doctorControllerProvider.notifier).state = _nurse;
        print(
            "in database ${_read(nurseControllerProvider.notifier).state.toString()}");
      });
      return true;
    } on FirebaseException catch (err) {
      print(err.message ?? err.toString());
      return false;
    }
  }
}
