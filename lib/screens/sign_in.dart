import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'package:heal_point/utilities/palette.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.heart_broken,
                    size: 36,
                    color: primaryColor,
                  ),
                  Text(
                    'Heal Point',
                    style: theme.headline1,
                  ),
                ],
              ),
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
                  theme: theme,
                  controller: phoneController,
                  hint: 'enter your phone number',
                  icon: const Icon(
                    LineIcons.mobilePhone,
                  ),
                  label: 'phone number',
                  obscureText: false),
              AuthField(
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
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: primaryColorLight,
                  fixedSize: const Size(250, 50),
                  textStyle: theme.bodyText1,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                child: const Text("Login"),
              ),
              const SizedBox(height: 16),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}

class AuthField extends StatelessWidget {
  const AuthField({
    Key? key,
    required this.theme,
    required this.label,
    required this.hint,
    required this.obscureText,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  final TextTheme theme;
  final String label;
  final String hint;
  final bool obscureText;
  final TextEditingController controller;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          focusColor: primaryColor,
          prefixIcon: icon,
          prefixIconColor: primaryColor,
          hoverColor: primaryColor,
          fillColor: primaryColor,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          suffixIcon: obscureText == true
              ? const Icon(
                  Icons.visibility,
                )
              : null,
          hintText: hint,
          labelText: label,
          labelStyle: theme.bodyText1,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
