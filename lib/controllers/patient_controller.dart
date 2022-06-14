// ignore_for_file: avoid_print

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

class PatientController extends StateNotifier<Patient> {
  // ignore: unused_field
  final Reader _read;
  PatientController(this._read, Patient patient) : super(patient);
  Patient get patient => state;
  //set student(Student _student) => student = _student;
  set data(Patient _patient) => state = _patient;

  void printPatient() {
    print(state);
  }

  String getName() {
    return state.names;
  }
}
