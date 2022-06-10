import 'package:heal_point/controllers/controllers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/models.dart';

final patientControllerProvider =
    StateNotifierProvider<PatientController, Patient>(
        (ref) => PatientController(ref.read, Patient.initial()));
final nurseControllerProvider =
    StateNotifierProvider<NurseController, Nurse>(
        (ref) => NurseController(ref.read, Nurse.initial()));

final healthCentersControllerProvider =
    StateNotifierProvider<HealthCentersControllers, List<HealthCenter>>(
        (ref) => HealthCentersControllers(ref.read, []));
final drugsControllerProvider =
    StateNotifierProvider<DrugsController, List<Drug>>(
        (ref) => DrugsController(ref.read, []));
final doctorsControllerProvider =
    StateNotifierProvider<DoctorsController, List<Doctor>>(
        (ref) => DoctorsController(ref.read, []));
final patientsControllerProvider =
    StateNotifierProvider<PatientsController, List<Patient>>(
        (ref) => PatientsController(ref.read, []));
final listOrdersControllerProvider =
    StateNotifierProvider<ListOrdersController, List<NurseOrder>>(
        (ref) => ListOrdersController(ref.read, []));
final doctorControllerProvider =
    StateNotifierProvider<DoctorController, Doctor>(
        (ref) => DoctorController(ref.read, Doctor.initial()));
