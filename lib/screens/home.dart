import 'package:flutter/material.dart';

import 'package:heal_point/screens/profile.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:line_icons/line_icons.dart';

import '../widgets/widgets.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 10,
        right: 5,
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
                  'Welcome,\nMr. John Doe',
                  style: _theme.headline2,
                ),
               
                const SizedBox(width: 50),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  onPressed: () {
                  },
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    LineIcons.bell,
                    size: 30,
                  ),
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
                      (e) => HealCard(theme: _theme),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Center's Categories",
              style: _theme.headline1!.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 75,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  "All",
                  "Hospitals",
                  "Clinics",
                  "Pharmacies",
                ]
                    .map(
                      (e) => CategoryBox(name: e),
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
