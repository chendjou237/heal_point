import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heal_point/routes/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase_options.dart';
import 'screens/screens.dart';
import 'utilities/utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ProviderScope(child: HealPointApp()));
}

class HealPointApp extends StatelessWidget {
   HealPointApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      
      
      
      

      
      

      

      
      
      
      
      
      
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
          headline3: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: primaryColorLight,
          ),
          bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.black87),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
