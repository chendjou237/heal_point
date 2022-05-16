import 'package:heal_point/controllers/controllers.dart';
import 'package:heal_point/controllers/drugs_controller.dart';
import 'package:heal_point/controllers/health_centers_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

final patientControllerProvider =
    StateNotifierProvider<PatientController, Patient>(
        (ref) => PatientController(ref.read, Patient.initial()));

final healthCentersControllerProvider =
    StateNotifierProvider<HealthCentersControllers, List<HealthCenter>>(
        (ref) => HealthCentersControllers(ref.read, []));
final drugsControllerProvider =
    StateNotifierProvider<DrugsController, List<Drug>>(
        (ref) => DrugsController(ref.read, []));
