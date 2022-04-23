import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 10,
        right: 5,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // controller.jumpToTab(3);
                  },
                  child: const CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        AssetImage('assets/images/profile_pic.jpg'),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'Welcome,\nMr. John Doe',
                  style: _theme.headline2,
                ),
                const SizedBox(width: 50),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    LineIcons.bell,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
          ],
        ),
      ),
    );
  }
}
