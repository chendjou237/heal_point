import 'package:flutter/material.dart';


class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    required TextTheme theme,
  }) : _theme = theme, super(key: key);

  final TextTheme _theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            child: Center(
              child: Text("Something went wrong", style: _theme.headline2),
            ),
            color: Colors.green,
          ),
        );
  }
}
