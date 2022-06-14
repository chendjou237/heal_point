//import 'package:auto_route/auto_route.dart';
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:heal_point/providers/providers.dart';
//import 'package:heal_point/routes/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NursePersonalPage extends ConsumerStatefulWidget {
  const NursePersonalPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NursePersonalPageState();
}

class _NursePersonalPageState extends ConsumerState<NursePersonalPage> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;
    final _db = ref.read(databaseProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(
            "Orders",
            style: _theme.headline1,
          ),
          const SizedBox(height: 20.0),
          const Text("Personal Orders"),
        ]),
      ),
    );
  }
}
