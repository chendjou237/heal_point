import 'package:flutter/material.dart';
import 'package:heal_point/utilities/palette.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class DoctorChatRoomPage extends ConsumerStatefulWidget {
  const DoctorChatRoomPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoctorChatRoomPageState();
}

class _DoctorChatRoomPageState extends ConsumerState<DoctorChatRoomPage> {
  @override
  Widget build(BuildContext context) {
     final _theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: secondaryColorLight,
        title: Text("Doctor Chat Room",style: _theme.titleMedium,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.router.pop(context),
        ),
      ),
      body: Container(
        child: Column(
         children: [const SingleChildScrollView(
            
            child: Center(
         child:     Text("No Discussion Yet"),
            ),
          ),
          Row(
            children: [
           const   TextField(
                decoration: InputDecoration(
                  hintText: "What's your question?",
                ),
              ),
              IconButton(
                  icon:const Icon(Icons.send),
                  onPressed: () {},
              ),
            ],
          ),
         ],
        ),
      ),
    );
  }
}
