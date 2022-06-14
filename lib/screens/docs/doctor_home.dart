import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:heal_point/routes/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DoctorHomePage extends ConsumerStatefulWidget {
  const DoctorHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends ConsumerState<DoctorHomePage> {
  @override
  Widget build(BuildContext context) {
    final _rooms = ref.read(chatRoomProvider);
    final _theme = Theme.of(context).textTheme;
    final _db = ref.read(databaseProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(
            "Patients",
            style: _theme.headline1,
          ),
          const SizedBox(height: 20.0),
          ..._rooms.map((room) => ListTile(
                title: Text(room.patientNames),
                subtitle: Text(room.lastMessage),
                trailing: Text(room.time),
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80'),
                ),
                onTap: () async {
                  await _db.getPatient(room.patientId);
                  context.pushRoute(const DoctorChatRoomRoute());
                },
              )),
        ]),
      ),
    );
  }
}

                        
                            