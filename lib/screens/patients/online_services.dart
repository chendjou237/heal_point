import 'package:flutter/material.dart';
import 'package:heal_point/utilities/palette.dart';
import 'package:heal_point/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineServicesPage extends ConsumerStatefulWidget {
  const OnlineServicesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OnlineServicesPage> createState() => _OnlineServicesPageState();
}

class _OnlineServicesPageState extends ConsumerState<OnlineServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('choose your bundle',
                  style: Theme.of(context).textTheme.headline1),
              const SizedBox(height: 16),
              ServiceBox(
                  image:
                      'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                  icon: Icons.chat_bubble_outline_outlined,
                  title: "Chat with Specialist",
                  onTap: () {},
                  desc:
                      "talk can help you better understand your circumstances"),
              const SizedBox(height: 16),
              ServiceBox(
                  image:
                      'https://images.unsplash.com/photo-1609188076864-c35269136b09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                  icon: Icons.phone_android,
                  title: "Call a Doctor",
                  onTap: () {},
                  desc:
                      'get face to face call with a doctor available right away ')
            ],
          ),
        ),
      ),
    );
  }

  void showChatForm() {
    String selectedBundle = '15 seconds';
    final _theme = Theme.of(context).textTheme;
    showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, setstate) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Chat Bundle',
                      style: _theme.headline4,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedBundle = 'starter';
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedBundle == 'starter'
                              ? secondaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("15 secnods", style: _theme.button),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedBundle = 'silver';
                        });
                      },
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: selectedBundle == 'silver'
                              ? secondaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("30 secnods", style: _theme.button),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedBundle = 'gold';
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedBundle == 'gold'
                              ? secondaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("60 secnods", style: _theme.button),
                      ),
                    ),
                    const Spacer(),
                    AuthButton(onTap: () {}, label: "Chat Now"),
                  ],
                ),
              );
            }));
  }
}
