// ignore_for_file: avoid_print

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

class PatientsController extends StateNotifier<List<Patient>> {
  // ignore: unused_field
  final Reader _read;
  PatientsController(this._read, List<Patient> patients) : super([]);
  List<Patient> get patients => state;
  //set student(Student _student) => student = _student;
  set data(List<Patient> _patient) => state = _patient;

  void printDocs() {
    print(state);
  }

  String getName() {
    return state.first.names;
  }
}
