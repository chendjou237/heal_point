// ignore_for_file: avoid_print

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

class DoctorsController extends StateNotifier<List<Doctor>> {
  // ignore: unused_field
  final Reader _read;
  DoctorsController(this._read, List<Doctor> docs) : super([]);
  List<Doctor> get docs => state;
  //set student(Student _student) => student = _student;
  set data(List<Doctor> _docs) => state = _docs;

  void printDocs() {
    print(state);
  }

  String getName() {
    return state.first.name;
  }
}
