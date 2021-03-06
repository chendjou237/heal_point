import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:heal_point/routes/route.gr.dart';
import 'package:heal_point/utilities/palette.dart';
import 'package:heal_point/widgets/heal_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import '../../providers/providers.dart';

class DoctorChatPlanPage extends ConsumerWidget {
  const DoctorChatPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose Your Plan",
                    style: _theme.headline1,
                  ),
                  HealButton(
                    label: "15 Minutes",
                    onTap: () {
                      context.pushRoute(ChatRoomRoute(timeLeft: 15000));
                    },
                  ),
                  HealButton(
                    label: "30 Minutes and prescription",
                    onTap: () {
                      // ref.read(startTimerProvider);
                      context.pushRoute(ChatRoomRoute(timeLeft: 30000));
                    },
                  ),
                  HealButton(
                    label: "1h and prescription",
                    onTap: () {
                      // ref.read(startTimerProvider);
                      
                      context.pushRoute(ChatRoomRoute(
                        timeLeft: 3600000,
                      ));
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class DoctorDescriptionPage extends ConsumerWidget {
  const DoctorDescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _doctor = ref.read(selectedDoctorProvider);
    final _theme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            const Icon(LineIcons.mapMarker, color: primaryColor),
            Text(_doctor.address, style: _theme.bodyText1),
          ],
        ),
        Row(
          children: [
            const Icon(LineIcons.thermometer, color: primaryColor),
            Text(_doctor.specialization, style: _theme.bodyText1),
          ],
        ),
        RatingBar.builder(
            itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
            onRatingUpdate: (change) {}),
        const SizedBox(height: 20.0),
        Text("Experience", style: _theme.headline2),
        const SizedBox(height: 20.0),
        Text(_doctor.experience, style: _theme.bodyText1),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            const SizedBox(width: 10),
            ElevatedButton.icon(
              label: const Text("online consultation"),
              icon: const Icon(Icons.phone, color: Colors.white),
              onPressed: () {},
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              label: const Text("book an appointment"),
              icon: const Icon(Icons.book, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
