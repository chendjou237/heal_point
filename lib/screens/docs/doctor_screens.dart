// ignore_for_file: unused_local_variable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:heal_point/routes/route.gr.dart';
import 'package:heal_point/screens/screens.dart';
import 'package:heal_point/utilities/palette.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';


import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class DoctorScreensPage extends ConsumerStatefulWidget {
  const DoctorScreensPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoctorScreensState();
}

class _DoctorScreensState extends ConsumerState<DoctorScreensPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentIndexProvider.state);
    final db = ref.read(databaseProvider);
    final user = ref.read(firebaseAuthProvider);
    final _theme = Theme.of(context).textTheme;
    return FutureBuilder(
        future: db.doctorDbInitializer(user.currentUser?.uid ?? "no id"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AutoTabsScaffold(
              scaffoldKey: _scaffoldkey,
             
              routes: const [
                DoctorRouter(),
                DoctorAppointmentsRoute(),
                DoctorCallsRoute(),
                DoctorProfileRoute(),
              ],
              bottomNavigationBuilder: (_, tabsRouter) {
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: GNav(
                      selectedIndex: tabsRouter.activeIndex,
                      onTabChange: tabsRouter.setActiveIndex,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      backgroundColor: const Color.fromARGB(255, 232, 242, 248),
                      haptic: true,
                      tabBorderRadius: 30,
                      curve: Curves.easeOutExpo,
                      duration: const Duration(milliseconds: 100),
                      gap: 8,
                      iconSize: 24,
                      tabBackgroundColor: secondaryColor.withOpacity(0.5),
                      tabs: const [
                        GButton(
                          icon: LineIcons.home,
                          text: 'Home',
                        ),
                        GButton(
                          icon: LineIcons.calendar,
                          text: 'Appointments',
                        ),
                        GButton(
                          icon: LineIcons.phone,
                          text: 'Call Request',
                        ),
                        // GButton(
                        //   icon: LineIcons.medkit,
                        //   text: 'Pharmacy',
                        // ),

                        GButton(
                          icon: LineIcons.user,
                          text: 'Account',
                        ),
                      ]),
                );
              },
            );
          } else if (snapshot.hasError) {
            return ErrorScreen(theme: _theme);
          }
          return const LoadingScreen();
        });
  }
}
