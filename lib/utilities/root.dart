import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heal_point/main.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../screens/screens.dart';

class Root extends ConsumerWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);
    final database = ref.read(databaseProvider);
    final _theme = Theme.of(context).textTheme;
    print(user);

    final auth = ref.read(firebaseAuthProvider);
    
    return user.when(
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (_, __) => Scaffold(
              body: Container(
                child: Center(
                  child: Text("Something went wrong", style: _theme.headline2),
                ),
                color: Colors.green,
              ),
            ),
        data: (authenticatedUser) {
          if (authenticatedUser != null) {
            // database.getPatient(authenticatedUser.uid);
            return const HealPoint();
          } else {
            return const HealPoint();
          }
        });
  }
}
