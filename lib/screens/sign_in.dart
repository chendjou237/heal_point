import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'package:heal_point/utilities/palette.dart';

import '../widgets/widgets.dart';

class SignIn extends ConsumerWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogo(theme: theme),
                const SizedBox(height: 24),
                Text(
                  'Welcome back!',
                  style: theme.headline2,
                ),
                const SizedBox(height: 16),
                Text(
                  'Enter your phone number and password',
                  style: theme.bodyText2,
                ),
                const SizedBox(height: 48),
                AuthField(
                    validator:
                        RequiredValidator(errorText: 'password is required'),
                    theme: theme,
                    controller: phoneController,
                    hint: 'enter your phone number',
                    icon: const Icon(
                      LineIcons.mobilePhone,
                    ),
                    label: 'phone number',
                    obscureText: false),
                AuthField(
                    validator:
                        RequiredValidator(errorText: 'password is required'),
                    theme: theme,
                    controller: passwordController,
                    hint: 'enter your password',
                    icon: const Icon(
                      Icons.password,
                    ),
                    label: 'password',
                    obscureText: true),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text("Forgot password?", style: theme.bodyText1),
                  ],
                ),
                const SizedBox(height: 24),
                AuthButton(
                  theme: theme,
                  onTap: () {},
                  label: "Login",
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/sign_up'),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: theme.bodyText1),
                      Text("Register Now!",
                          style: theme.bodyText1!.copyWith(
                            color: primaryColorLight,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(children: const <Widget>[
                  Expanded(child: Divider()),
                  Text("OR"),
                  Expanded(child: Divider()),
                ]),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(LineIcons.googleLogo),
                    label: const Text("Connect with Google")),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      LineIcons.facebook,
                      color: Colors.white,
                    ),
                    label: const Text("Connect with Facebook")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
