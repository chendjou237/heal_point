import 'dart:async';

import 'package:heal_point/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedCategoryProvider = StateProvider((_) => "All");
final selectedDoctorProvider = StateProvider<Doctor>((ref) {
  return Doctor.initial();
});
final selectedCenterProvider = StateProvider(
  (_) => HealthCenter(
      id: "",
      name: "Central Hospital",
      address: "poste central",
      phoneNumber: "+237678784546",
      rating: 2.2,
      image: "assets/images/health_center/central_hospital.jpg",
      description: "The hospital somewhere in the center of yaounde"),
);

final chatRoomProvider = StateProvider<List<ChatRoom>>((ref) {
  return [];
});

final startProvider = StateProvider<int>((ref) {
  return 0;
});
final timerProvider = StateProvider<Timer>((ref) {
  return Timer(Duration.zero, () {});
});
final sessionStatusProvider = StateProvider<bool>((ref) {
  return false;
});

final startTimerProvider = StateProvider<void>((ref) {
  // final _timer = ref.watch(timerProvider.state);
  // final _start = ref.watch(startProvider.state);
  // final _db = ref.read(databaseProvider);
  // final _patient = ref.read(patientControllerProvider);
  // ref.read(sessionStatusProvider.state).state = true;
  // const oneSec = Duration(seconds: 1);
  // _timer.state = Timer.periodic(
  //   oneSec,
  //   (Timer timer) async{
  //     if (_start.state == 0) {
  //       timer.cancel();
  //       _timer.state.cancel();
  //      await _db.closeSession(_patient.id!);

        
  //     } else {
  //       _start.state--;
  //     }
  //   },
  // );
  
});
