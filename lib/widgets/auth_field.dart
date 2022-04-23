import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utilities/utilities.dart';
class AuthField extends ConsumerWidget {
  const AuthField({
    Key? key,
    required this.theme,
    required this.label,
    required this.hint,
    required this.obscureText,
    required this.controller,
    required this.icon,
    required this.validator,
  }) : super(key: key);

  final TextTheme theme;
  final String label;
  final String hint;
  final bool obscureText;
  final TextEditingController controller;
  final Icon icon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context,ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(   
        validator: validator,
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

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
