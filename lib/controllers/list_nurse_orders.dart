// ignore_for_file: avoid_print

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

class ListOrdersController extends StateNotifier<List<NurseOrder>> {
  // ignore: unused_field
  final Reader _read;
  ListOrdersController(this._read, List<NurseOrder> orders) : super([]);
  List<NurseOrder> get orders => state;
  //set student(Student _student) => student = _student;
  set data(List<NurseOrder> _orders) => state = _orders;

  void printOrders() {
    print(state);
  }

  String getName() {
    return state.first.name;
  }
}
