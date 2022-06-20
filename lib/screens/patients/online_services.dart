import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heal_point/routes/route.gr.dart';
import 'package:heal_point/utilities/palette.dart';
import 'package:heal_point/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final selectedBundleProvider = StateProvider<String>((ref) {
  return 'starter';
});
final Uri _url =
    Uri.parse('https://links.payunit.net/pay/62b01180c8a95f1e7f7c4052');

class OnlineServicesPage extends ConsumerStatefulWidget {
  const OnlineServicesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OnlineServicesPage> createState() => _OnlineServicesPageState();
}

class _OnlineServicesPageState extends ConsumerState<OnlineServicesPage> {
  Future<bool> _launchUrl() async {
    if (!await launchUrl(_url)) {
      return true;
    } else {
      print("something went wrong");
      return true;
    }
    // throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('choose your bundle',
                  style: Theme.of(context).textTheme.headline1),
              const SizedBox(height: 16),
              ServiceBox(
                  image:
                      'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                  icon: Icons.chat_bubble_outline_outlined,
                  title: "Chat with Specialist",
                  onTap: () => showChatForm(),
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
    final selectedBundle = ref.read(selectedBundleProvider.state);
    final _theme = Theme.of(context).textTheme;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => StatefulBuilder(builder: (context, setstate) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: secondaryColorLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Chat Bundle (just to test with small Times)',
                      style: _theme.headline4,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedBundle.state = 'starter';
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectedBundle.state == 'starter'
                              ? secondaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("10 minutes ", style: _theme.button),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedBundle.state = 'silver';
                        });
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: selectedBundle.state == 'silver'
                              ? secondaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("30 minutes", style: _theme.button),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedBundle.state = 'gold';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 24),
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedBundle.state == 'gold'
                              ? secondaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("1 hour", style: _theme.button),
                      ),
                    ),
                    const Spacer(),
                    AuthButton(
                        onTap: () async {
                          if (await _launchUrl()) {
                            context.pushRoute(ChatRoomRoute(
                              timeLeft: selectedBundle.state == 'starter'
                                  ? 600000
                                  : selectedBundle.state == 'silver'
                                      ? 1200000
                                      : 3600000,
                            ));
                          }
                        },
                        label: "Chat Now"),
                    const SizedBox(height: 45),
                  ],
                ),
              );
            }));
  }
}
