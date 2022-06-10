import 'package:flutter/material.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 10,
          right: 0,
        ),
        child: SingleChildScrollView(child: Column(
          children: [
            Text('Catalogue', style: _theme.headline1),
          ],
        )),
      ),
    );
  }
}