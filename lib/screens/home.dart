import 'package:flutter/material.dart';

import 'package:heal_point/models/models.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:heal_point/routes/route.gr.dart';
import 'package:heal_point/screens/screens.dart';
import 'package:auto_route/auto_route.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:line_icons/line_icons.dart';

import '../widgets/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _theme = Theme.of(context).textTheme;
    final patient = ref.read(patientControllerProvider);
    final _auth = ref.read(authProvider);
    // final _centerConsume = ref.read(selectedCenterProvider.state);
    print("controller ${patient.toString()}");
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 10,
        right: 0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ProfilePage()),
                    // );
                    context.pushRoute(ProfileRouter());
                    // controller.jumpToTab(3);
                  },
                  child: const Hero(
                    tag: 'profile',
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                          AssetImage('assets/images/profile_pic.jpg'),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'Welcome,\nMr. ${patient.names}',
                  style: _theme.headline2,
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      onPressed: () async {
                        // Navigator.pushNamed(context, "/sign_in");
                        // Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => SignIn()));
                        context.pushRoute(RootRouter());
                      },
                      icon: const Icon(
                        LineIcons.bell,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "For You",
              style: _theme.headline1,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                    .map(
                      (e) { 
                     
                        return HealCard(
                        theme: _theme,
                        healthCenter:   HealthCenter(
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
                      }
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Center's Categories",
              style: _theme.headline1?.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 75,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  "Yaounde",
                  "Bafoussam",
                  "Edea",
                  "Ngaoundere",
                  "Bertoua",
                  "Douala",
                  "Bamenda",
                  "Buea",
                  "Kribi",
                  "Bafang",
                ]
                    .map(
                      (e) => CategoryBox(name: e),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Hospitals",
              style: _theme.headline1,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                    .map(
                      (e) => HealCard(
                        theme: _theme,
                        healthCenter: HealthCenter(
                            id: "",
                            name: "General Hospital",
                            address: "Ngousso",
                            phoneNumber: "+237678784546",
                            rating: 3.1,
                            image:
                                "assets/images/health_center/general_hospital.jpg",
                            description:
                                "The hospital somewhere in the center of yaounde"),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Pharmacies",
              style: _theme.headline1,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                    .map(
                      (e) => HealCard(
                        theme: _theme,
                        healthCenter: HealthCenter(
                            id: "",
                            name: "Statoise Pharmacy",
                            address: "Etoudi",
                            phoneNumber: "+237678784546",
                            rating: 4.2,
                            image:
                                "assets/images/health_center/statoise_pharmarcie.jpg",
                            description:
                                "The hospital somewhere in the center of yaounde"),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Clinics",
              style: _theme.headline1,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                    .map(
                      (e) => HealCard(
                        theme: _theme,
                        healthCenter: HealthCenter(
                            id: "",
                            name: "Wellstar Clinics",
                            address: "Zouatoupsi",
                            phoneNumber: "+237678784546",
                            rating: 2.8,
                            image:
                                "assets/images/health_center/wellstar_clinic.jpg",
                            description:
                                "The hospital somewhere in the center of yaounde"),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
