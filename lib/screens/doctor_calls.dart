import 'package:flutter/material.dart';

class DoctorCallsPage extends StatelessWidget {
  const DoctorCallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Doctor Calls'),
        ),
      ),
    );
  }
}
