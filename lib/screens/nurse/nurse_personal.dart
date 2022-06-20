//import 'package:auto_route/auto_route.dart';
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:heal_point/screens/nurse/nurse_home.dart';
//import 'package:heal_point/routes/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NursePersonalPage extends ConsumerStatefulWidget {
  const NursePersonalPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NursePersonalPageState();
}

class _NursePersonalPageState extends ConsumerState<NursePersonalPage> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;
    final _db = ref.read(databaseProvider);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              "Orders",
              style: _theme.headline1,
            ),
            const SizedBox(height: 20.0),
            Text("Personal Orders", style: _theme.headline3),
            const SizedBox(height: 30.0),
            ...ref
                .read(personalOrdersProvider.state)
                .state
                .map((room) => ListTile(
                      title: Text(room.name),
                      subtitle: Text(room.description),
                      trailing: Text(room.townQuarter),
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80'),
                      ),
                      onTap: () async {
                        // await _db.getPatient(room.patientId);
                        // context.pushRoute(const DoctorChatRoomRoute());
                      },
                    )),
          ]),
        ),
      ),
    );
  }
}
