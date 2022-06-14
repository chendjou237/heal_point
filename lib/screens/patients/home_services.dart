import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heal_point/utilities/palette.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../widgets/widgets.dart';

final dateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

class HomeServicesPage extends ConsumerStatefulWidget {
  const HomeServicesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeServicesPage> createState() => _HomeServicesPageState();
}

class _HomeServicesPageState extends ConsumerState<HomeServicesPage> {
  @override
  Widget build(BuildContext context) {
    const image =
        'https://media.istockphoto.com/photos/shot-of-a-young-doctor-using-a-digital-tablet-in-a-modern-hospital-picture-id1366374033';
    const title = 'Doctor';
    const icon = LineIcons.phone;
    const desc = 'get your doctor home';

    final _theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Services',
          style: _theme.titleMedium,
        ),
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(
            "What do you want home?",
            style: _theme.headline2,
          ),
          const SizedBox(
            height: 8,
          ),
          ServiceBox(
              image: image,
              icon: icon,
              title: title,
              onTap: () {
                // context.pushRoute();
                showModalBottomSheet(
                    context: context,
                    builder: (context) => form(_theme),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))));
              },
              desc: desc),
          const SizedBox(
            height: 16,
          ),
          ServiceBox(
              image:
                  'https://images.unsplash.com/photo-1542884748-2b87b36c6b90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmxhY2slMjBkb2N0b3J8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
              icon: LineIcons.nurse,
              title: "Nurse",
              onTap: () {
               showModalBottomSheet(
                    context: context,
                    builder: (context) => form(_theme),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))));
              },
              desc: "Your home nurse for injections, hospitalization, etc."),
        ]),
      )),
    );
  }

  Widget form(
    TextTheme style,
  ) {
    final _controller = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
        color: primaryColorLight,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Details',
            style: style.headline3,
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter your street address',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            readOnly: true,
            onTap: () async {
              final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                    2022,
                    1,
                    1,
                  ),
                  lastDate: DateTime.now().add(const Duration(days: 90)));
              ref.read(dateProvider.notifier).state = date ?? DateTime.now();
              _controller.text =
                  ref.read(dateProvider.notifier).state.toString();
            },
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter The day of the visite',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const Spacer(),
          AuthButton(
              onTap: () {
                context.popRoute();
              },
              label: 'Order Now'),
        ],
      ),
    );
  }
}
