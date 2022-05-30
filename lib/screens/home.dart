import 'package:flutter/material.dart';

import 'package:heal_point/providers/providers.dart';
import 'package:heal_point/routes/route.gr.dart';
import 'package:auto_route/auto_route.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utilities/utilities.dart';
import '../widgets/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _theme = Theme.of(context).textTheme;
    final _patient = ref.read(patientControllerProvider);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            backgroundColor,
            secondaryColor,
          ],
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //lorem ipsum text
            Text(
              '${_patient.email.trim()} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: _theme.bodyMedium,
            ),

            const SizedBox(height: 20),

            HealButton(
                label: "Get Started",
                onTap: () {
                  AutoRouter.of(context).push(const DoctorDetailsRoute());
                }),
          ]),
    );
  }
}
