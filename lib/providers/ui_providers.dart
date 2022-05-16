import 'package:heal_point/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedCategoryProvider = StateProvider((_)=>  "All");
final selectedCenterProvider = StateProvider((_)=>  HealthCenter(
                            id: "",
                            name: "Central Hospital",
                            address: "poste central",
                            phoneNumber: "+237678784546",
                            rating: 2.2,
                            image:
                                "assets/images/health_center/central_hospital.jpg",
                            description:
                                "The hospital somewhere in the center of yaounde"),
                      );