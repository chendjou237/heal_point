import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:heal_point/utilities/palette.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';

class CenterDetailsPage extends ConsumerWidget {
  CenterDetailsPage({Key? key}) : super(key: key);
  static const routeName = '/center_detail';

  String contentType = "Description";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _center = ref.read(selectedCenterProvider);
    final _theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_center.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            color: primaryColorDark,
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            color: primaryColorDark,
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.notifications),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _center.name,
                        style: _theme.headline1,
                      ),
                      const SizedBox(height: 20.0),
                      const Description(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Description extends ConsumerWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _center = ref.read(selectedCenterProvider);
    final _theme = Theme.of(context).textTheme;
    

    return Column(
      children: [
        Row(
          children: [
            const Icon(LineIcons.mapMarker, color: primaryColor),
            Text(_center.address, style: _theme.bodyText1),
          ],
        ),
        Row(
          children: [
            const Icon(LineIcons.running, color: primaryColor),
            Text("40m away", style: _theme.bodyText1),
          ],
        ),
        RatingBar.builder(
            itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
            onRatingUpdate: (change) {}),
        const SizedBox(height: 20.0),
        Text("Description", style: _theme.headline2),
        const SizedBox(height: 20.0),
        Text(_center.description, style: _theme.bodyText1),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(36.0),
              ),
              child: IconButton(
                splashRadius: 20.0,
                onPressed: () {
                  // controller.jumpToTab(2);
                  // context.
                },
                icon: const Icon(Icons.phone, color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              label: const Text("Find"),
              icon: const Icon(Icons.navigation_rounded, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

// class Comments extends StatelessWidget {
//   const Comments({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Comments',
//         style: Styles.header,
//       ),
//     );
//   }
// }

// class Statistics extends StatelessWidget {
//   const Statistics({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(32.0),
//           topRight: Radius.circular(32.0),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             children: [
//               Text(
//                 "MBOABIN-008TH",
//                 style: Styles.designWith(
//                     color: Palette.primary, size: 20.0, bold: true),
//               ),
//               const SizedBox(height: 8.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(Iconsax.location, color: Palette.primary),
//                       const Text("Yaounde I, Messassi"),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(Iconsax.activity, color: Palette.primary),
//                       const Text("78%"),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       const Text("More"),
//                       Icon(CupertinoIcons.download_circle,
//                           color: Palette.primary),
//                     ],
//                   ),
//                 ],
//               ),
//               SfCircularChart(
//                   title: ChartTitle(text: 'Waste Collection Analysis'),
//                   legend: Legend(isVisible: true),
//                   series: <PieSeries<MboaData, String>>[
//                     PieSeries<MboaData, String>(
//                         explode: true,
//                         explodeIndex: 0,
//                         dataSource: <MboaData>[
//                           MboaData('Jan', 35),
//                           MboaData('Feb', 28),
//                           MboaData('Mar', 34),
//                           MboaData('Apr', 32),
//                           MboaData('May', 40)
//                         ],
//                         xValueMapper: (MboaData data, _) => data.day,
//                         yValueMapper: (MboaData data, _) => data.state,
//                         dataLabelMapper: (MboaData data, _) => data.day,
//                         dataLabelSettings:
//                             const DataLabelSettings(isVisible: true)),
//                   ]),
//               ActionButton(
//                 title: "Download Stats",
//                 onTap: () {},
//                 icon: const Icon(Icons.download, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
//         SliverAppBar(
//           expandedHeight: 300.0,
//           title: Text(
//             "Etoudi",
//             style: Styles.designWith(
//                 color: Palette.primary, size: 25.0, bold: false),
//           ),
//           // backgroundColor: CupertinoColors.activeGreen.withOpacity(.35),
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Palette.primary,
//                 width: 1.0,
//               ),
//               image: const DecorationImage(
//                 image: AssetImage('assets/images/city_bg.png'),
//                 fit: BoxFit.cover,
//               ),
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//           ),
//         ),
        
//       ]),



