// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:heal_point/main.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../screens/screens.dart';
import '../widgets/widgets.dart';

User? userState;

class RootPage extends ConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);
    final database = ref.read(databaseProvider);
    final _theme = Theme.of(context).textTheme;
    // print(user);

    final auth = ref.read(firebaseAuthProvider);

    return user.when(
        loading: () => const LoadingScreen(),
        error: (_, __) => ErrorScreen(theme: _theme),
        data: (authenticatedUser) {
          userState = authenticatedUser;
          if (authenticatedUser != null) {
            // database.getPatient(authenticatedUser.uid);

            return const HealPointPage();
          } else {
            return  const SignInPage();
          }
        });
  }
}

// class RootTwoPage extends ConsumerWidget {
//   const RootTwoPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return StreamBuilder<Object>(
//       stream: ref.read(authProvider.state).state.authStateChanges as Stream<Object>,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return ErrorScreen(theme: Theme.of(context).textTheme);
//         }
//         if (snapshot.hasData) {
//           return const HealPointPage();
//         } else {
//           return SignInPage();
//         }
          
//         }
//         // return Container();
      
//     );
//   }
// }
