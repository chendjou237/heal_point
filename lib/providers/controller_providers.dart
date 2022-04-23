import 'package:heal_point/controllers/controllers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

final patientControllerProvider =
    StateNotifierProvider.autoDispose<PatientController, Patient>(
        (ref) => PatientController(ref.read, Patient.initial()));
