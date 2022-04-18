import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// Import the generated file
import 'firebase_options.dart';
import 'utilities/utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const HealPoint());
}

class HealPoint extends StatelessWidget {
  const HealPoint({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Root(),
    );
  }
}