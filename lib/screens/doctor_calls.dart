import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DoctorCallsPage extends StatelessWidget {
  const DoctorCallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(
        'https://assets2.lottiefiles.com/packages/lf20_0gZKjV.json',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
