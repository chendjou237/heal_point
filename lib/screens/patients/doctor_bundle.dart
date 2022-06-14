//import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heal_point/widgets/widgets.dart';

//import '../../routes/route.gr.dart';

class DoctorBundlePage extends StatelessWidget {
  const DoctorBundlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text('choose your bundle', style: Theme.of(context).textTheme.headline1),
              const SizedBox(height: 16),
              HealButton(
                label: 'chat with a doctor',
                onTap: () {
                  // context.pushRoute(ChatRoomRoute(timeLeft: 15000));
                },
              ),
              HealButton(
                label: 'book an appointment',
                onTap: () {
                  // context.pushRoute(ChatRoomRoute(timeLeft: 30000));
                },
              ),
            ],
          ),
        ),
      ),
    
    );
  }
}