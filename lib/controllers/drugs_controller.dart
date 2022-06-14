// ignore_for_file: avoid_print

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

class DrugsController extends StateNotifier<List<Drug>> {
  // ignore: unused_field
  final Reader _read;
  DrugsController(this._read, List<Drug> drugs) : super([]);
  List<Drug> get drugs => state;
  //set student(Student _student) => student = _student;
  set data(List<Drug> _drugs) => state = _drugs;

  void printDrugs() {
    print(state);
  }

  String getName() {
    return state.first.name;
  }
}
