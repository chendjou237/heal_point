import 'package:flutter/material.dart';

import 'package:heal_point/models/models.dart';
import 'package:heal_point/providers/providers.dart';


import 'package:heal_point/screens/profile.dart';


import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:line_icons/line_icons.dart';

import '../widgets/widgets.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _theme = Theme.of(context).textTheme;
    final patient = ref.read(patientControllerProvider);
    final _auth = ref.read(authProvider);
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
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                   
                    // controller.jumpToTab(3);
                  },
                  child: const CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        AssetImage('assets/images/profile_pic.jpg'),
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
                        await _auth.signOut(context);
                        // Navigator.pushNamed(context, "/sign_in");
                        // Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => SignIn()));
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
                      (e) => HealCard(
                        theme: _theme,
                        healthCenter: HealthCenter(
                            id: "",
                            name: "Central Hospital",
                            address: "poste central",
                            phoneNumber: "+237678784546",
                            rating: 2.2,
                            image: "assets/images/central_hospital.jpg",
                            description:
                                "The hospital somewhere in the center of yaounde"),
                      ),
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
                            image: "assets/images/general_hospital.jpg",
                            description:
                                "The hospital somewhere in the center of yaounde"),
                      ),
                    )
                    .toList(),
              ),
            ),
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
                            image: "assets/images/statoise_pharmarcie.jpg",
                            description:
                                "The hospital somewhere in the center of yaounde"),
                      ),
                    )
                    .toList(),
              ),
            ),
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
                            image: "assets/images/wellstar_clinic.jpg",
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
