// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:heal_point/routes/route.gr.dart';
import '../models/models.dart';

class HealCard extends StatelessWidget {
  const HealCard({
    Key? key,
    required TextTheme theme,
    required this.healthCenter,
  })  : _theme = theme,
        super(key: key);

  final TextTheme _theme;
  final HealthCenter healthCenter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/center_detail');
        context.pushRoute( CenterDetailsRoute());
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
            image: AssetImage(healthCenter.image),
            fit: BoxFit.cover,
          ),
        ),
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                IconButton(
                  icon: Icon(
                    Icons.star,
                    size: 30,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(healthCenter.name,
                    style: _theme.headline2?.copyWith(color: Colors.white)),
                const SizedBox(height: 8),
                RatingBar.builder(
                  ignoreGestures: true,
                  itemSize: 16,
                  initialRating: healthCenter.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 16, color: Colors.white.withOpacity(0.5)),
                    const SizedBox(width: 8),
                    Text(
                      healthCenter.address,
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
