import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// Import the generated file
import 'firebase_options.dart';
import 'screens/screens.dart';
import 'utilities/utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: HealPointApp()));
}

class HealPointApp extends StatelessWidget {
  const HealPointApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Root(),
        '/home': (context) => const Home(),
        '/sign_up': (context) => SignUp(),
        '/sign_in': (context) => const SignIn(),
        // '/verify_phone_number': (context) => const VerifyPhoneScreen(),
        // '/personal_info': (context) => const PersonalInfo(),
        '/password': (context) => const PasswordScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          color: Colors.white10,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        primaryColor: primaryColor,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          headline2: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: primaryColorDark,
          ),
          bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
