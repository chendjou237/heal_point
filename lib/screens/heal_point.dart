import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:heal_point/screens/screens.dart';
import 'package:heal_point/utilities/palette.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../models/models.dart';

final currentIndexProvider = StateProvider((ref) => 0);
final infoProvider = StateProvider((ref) =>  Directions);
class HealPoint extends ConsumerStatefulWidget {
  const HealPoint({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HealPointState();
}

class _HealPointState extends ConsumerState<HealPoint> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentIndexProvider.state);
    return Scaffold(
      extendBody: true,
      floatingActionButton: currentIndex.state == 1
          ? FloatingActionButton(
              onPressed: () => googleMapController.animateCamera(
                info != null  ?
                
                  CameraUpdate.newLatLngBounds(info!.bounds,100.0):
                  CameraUpdate.newCameraPosition(initialCameraPosition),),
              backgroundColor: secondaryColor,
              child: const Icon(Icons.near_me, color: Colors.white),
            )
          : const SizedBox.shrink(),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() => currentIndex.state = index);
          },
          children: const <Widget>[
            Home(),
            NearMe(),
            Pharmacy(),
            Orders(),
            Rating(),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: GNav(
            onTabChange: (index) {
              setState(() {
                _pageController.jumpToPage(index);
              });
            },
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                icon: LineIcons.compass,
                text: 'Near Me',
              ),
              GButton(
                icon: Icons.payment,
                text: 'Orders',
              ),
              GButton(
                icon: LineIcons.medkit,
                text: 'Pharmacy',
              ),
              GButton(
                icon: LineIcons.star,
                text: 'Ratings',
              )
            ]),
      ),
    );
  }
}
