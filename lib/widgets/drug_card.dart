import 'package:flutter/material.dart';
/*import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:heal_point/routes/route.gr.dart';*/
import 'package:heal_point/utilities/utilities.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/models.dart';
import '../providers/providers.dart';

final Uri _url =
    Uri.parse('https://links.payunit.net/pay/62b00761c8a95f1e7f7c404a');

class DrugCard extends ConsumerWidget {
  const DrugCard({
    Key? key,
    required TextTheme theme,
    required this.drug,
  })  : _theme = theme,
        super(key: key);

  final TextTheme _theme;
  final Drug drug;

  Future<bool> _launchUrl() async {
    if (!await launchUrl(_url)) {
      return true;
    } else {
      print("something went wrong");
      return true;
    }
    // throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.read(databaseProvider);
    final locationController = TextEditingController();
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/center_detail');
        showModalBottomSheet(
          context: context,
          builder: (context) => SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(bottom: 80),
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: secondaryColorLight.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      '${drug.image}',
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      drug.name,
                      style: _theme.headline1,
                    ),
                    const SizedBox(height: 5),
                    Row(children: [
                      const Icon(
                        LineIcons.capsules,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${drug.price} Fcfa',
                        style: _theme.subtitle1,
                      ),
                    ]),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(LineIcons.store),
                        const SizedBox(width: 5),
                        Text("${drug.quantity} In Stock"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration: InputDecoration(
                      labelText: 'Location',
                      labelStyle: const TextStyle(color: secondaryColorLight),
                      hintText: "Enter the location",
                      hintStyle: const TextStyle(color: secondaryColorDark),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(drug.details, style: _theme.bodyText1)),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () async {
                        if (await _launchUrl()) {
//  if (await db.createNurseOrder(NurseOrder(
//                     name: nameController.text,
//                     date: dateController.text,
//                     time: timeController.text,
//                     townQuarter: townQuarterController.text,
//                     description: descriptionController.text,
//                   )
//                   )) {
//                     const SnackBar(
//                       content: Text('Order created'),
//                     );
//                   }
                        }
                      },
                      icon: const Icon(Icons.payment),
                      label: const Text("Add to Cart"),
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                      ),
                    ),
                  ]),
            ),
          ),
        );
        // context.pushRoute(const CenterDetailsRoute());
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage('${drug.image}'),
            fit: BoxFit.cover,
          ),
        ),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                // const SizedBox(),
                // IconButton(
                //   icon: Icon(
                //     Icons.star,
                //     size: 30,
                //     color: Colors.white.withOpacity(0.5),
                //   ),
                //   onPressed: () {},
                // ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(drug.name,
                    style: _theme.headline2?.copyWith(color: Colors.white)),
                const SizedBox(height: 8),
                Text('${drug.price} FCFA',
                    style: _theme.headline2?.copyWith(color: Colors.white)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(LineIcons.capsules,
                        size: 16, color: Colors.white.withOpacity(0.5)),
                    const SizedBox(width: 8),
                    Text(
                      drug.type,
                      style: _theme.bodyText2?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
