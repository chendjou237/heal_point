// ignore_for_file: avoid_print

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

class HealthCentersControllers extends StateNotifier<List<HealthCenter>> {
  // ignore: unused_field
  final Reader _read;
  HealthCentersControllers(this._read, List<HealthCenter> healthCenters) : super([]);
  List<HealthCenter> get healthCenters => state;
  //set student(Student _student) => student = _student;
  set data(List<HealthCenter> _healthCenters) => state = _healthCenters;

  void printHealthCenters() {
    print(state);
  }

  String getName() {
    return state.first.name;
  }
}
