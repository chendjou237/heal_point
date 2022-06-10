import 'package:flutter/material.dart';
import 'package:heal_point/utilities/utilities.dart';
import 'package:heal_point/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

import '../../models/models.dart';

class PharmacyPage extends StatelessWidget {
  const PharmacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;
    // ignore: prefer_const_constructors
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 38,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pharmacy",
              style: _theme.headline1,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Your online drug store",
              style: _theme.headline2!
                  .copyWith(color: primaryColor.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
                decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    labelStyle: _theme.bodyText1!
                        .copyWith(color: Colors.black.withOpacity(0.5)),
                    prefixIcon: const Icon(Icons.search),
                    labelText: "Search for a drug",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                  ),
                )),
            const SizedBox(height: 32),
            Container(
              height: 200,
              width: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
                color: secondaryColor,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 8.0,
                      bottom: 16.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "We Will Deliver \n Your Medecine",
                          style: _theme.headline4!.copyWith(
                            color: backgroundColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColorLight,
                            padding: const EdgeInsets.all(16),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24.0))),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Catalog",
                            style: _theme.headline2!
                                .copyWith(color: backgroundColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Lottie.network(
                    "https://assets5.lottiefiles.com/packages/lf20_ggwvc2su.json",
                    width: 150,
                    height: 150,
                    // frameRate: FrameRate(1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text("Popular", style: _theme.headline1),
            const SizedBox(height: 8),
            //gridview
            SizedBox(
              height: 2000,
              child: GridView.count(
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 16,
                  physics: const BouncingScrollPhysics(),
                  children: drugs
                      .map(
                        (drug) => DrugCard(theme: _theme, drug: drug) )
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }
}

List<Drug> drugs = [
  Drug(
    id: '',
    name: 'drug 1',
    quantity: 5,
    details: '',
    price: 1000.0,
    image: 'assets/images/drugs/drug_1.jpg',
    category: 'Health',
    type: 'Tablets',
  ),
  Drug(
    id: '',
    name: 'drug 2',
    quantity: 15,
    details: '',
    price: 3000.0,
    image: 'assets/images/drugs/drug_2.jpg',
    category: 'Health',
    type: 'Tablets',
  ),
  Drug(
    id: '',
    name: 'drug 3',
    quantity: 10,
    details: '',
    price: 1500.0,
    image: 'assets/images/drugs/drug_3.jpg',
    category: 'Health',
    type: 'Tablets',
  ),
  Drug(
    id: '',
    name: 'drug 4',
    quantity: 20,
    details: '',
    price: 3200.0,
    image: 'assets/images/drugs/drug_4.jpg',
    category: 'Health',
    type: 'Tablets',
  ),
  Drug(
    id: '',
    name: 'drug 5',
    quantity: 1,
    details: '',
    price: 10000.0,
    image: 'assets/images/drugs/drug_5.jpg',
    category: 'Health',
    type: 'Tablets',
  ),
  Drug(
    id: '',
    name: 'drug 1',
    quantity: 5,
    details: '',
    price: 2000.0,
    image: 'assets/images/drugs/drug_1.jpg',
    category: 'Health',
    type: 'Tablets',
  ),
];

// Container(
//                           decoration: BoxDecoration(
//                             color: secondaryColorLight,
//                             borderRadius: BorderRadius.circular(16),
//                             boxShadow: const [],
//                           ),
//                           child: Column(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(32),
//                                 ),
//                                 child: Image.asset(
//                                   '${e.image}',
//                                 ),
//                               ),
//                               const SizedBox(height: 16),
//                               Text(e.name,
//                               style: _theme.bodyText2,
//                               )
//                             ],
//                           ),
//                         ),
                     