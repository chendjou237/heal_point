import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DoctorHomePage extends ConsumerStatefulWidget {
  const DoctorHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends ConsumerState<DoctorHomePage> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children:  [
          Text(
            "Patients",style: _theme.headline1,
          ),
          const SizedBox(height: 20.0),
          
        ]),
      ),
    );
  }
}
