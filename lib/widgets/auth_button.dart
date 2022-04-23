import 'package:flutter/material.dart';
import 'package:heal_point/utilities/utilities.dart';



class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.theme,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  final TextTheme theme;
  final void Function() onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: primaryColorLight,
        fixedSize: const Size(250, 50),
        textStyle: theme.bodyText1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      child:  Text(label ),
    );
  }
}