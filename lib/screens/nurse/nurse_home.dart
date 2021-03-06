//import 'package:auto_route/auto_route.dart';
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:heal_point/models/nurse_order.dart';
import 'package:heal_point/providers/providers.dart';
//import 'package:heal_point/routes/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final personalOrdersProvider = StateProvider<List<NurseOrder>>((ref) {
  return [];
});

class NurseHomePage extends ConsumerStatefulWidget {
  const NurseHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NurseHomePageState();
}

class _NurseHomePageState extends ConsumerState<NurseHomePage> {
  @override
  Widget build(BuildContext context) {
    final _rooms = ref.read(listOrdersControllerProvider);
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
            ..._rooms.map((room) => GestureDetector(
                  onTap: () {
                    final list = [
                      ...ref.read(personalOrdersProvider.state).state,
                      room
                    ];
                    ref.read(personalOrdersProvider.state).state = list;
                  },
                  child: ListTile(
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
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
