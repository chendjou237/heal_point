// ignore_for_file: avoid_print

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

class NurseController extends StateNotifier<Nurse> {
  // ignore: unused_field
  final Reader _read;
  NurseController(this._read, Nurse nurse) : super(nurse);
  Nurse get nurse => state;
  //set student(Student _student) => student = _student;
  set data(Nurse _nurse) => state = _nurse;

  void printNurse() {
    print(state);
  }

  String getName() {
    return state.name;
  }
}
