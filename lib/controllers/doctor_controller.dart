import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

class DoctorController extends StateNotifier<Doctor> {
  // ignore: unused_field
  final Reader _read;
  DoctorController(this._read, Doctor doc) : super(doc);
  Doctor get doc => state;
  //set student(Student _student) => student = _student;
  set data(Doctor _doc) => state = _doc;

  void printDoctor() {
    print(state);
  }

  String getName() {
    return state.name;
  }
}
