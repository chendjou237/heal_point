import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heal_point/routes/route.gr.dart';
import 'package:heal_point/utilities/utilities.dart';
import 'package:heal_point/widgets/service_box.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Choose Your Services',
          style: _theme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     color: primaryColorLight,
              //     borderRadius: BorderRadius.circular(16),

              //   ),
              //   child: ListTile(
              //     leading: Icon(LineIcons.phone),
              //     title: Text("Online Offers", style: _theme.headline3,),
              //     trailing: Icon(Icons.arrow_forward_ios),
              //     // onTap: ()=> context.pushRoute(),
              //   ),
              // ),
              ServiceBox(
                onTap: () {
                  context.pushRoute(const OnlineServicesRoute());
                },
                icon: Icons.phone_android_rounded,
                title: "Online Services",
                image:
                    'https://images.unsplash.com/photo-1605214178469-178b98bb29fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80',
                desc: "Discover what you can do from home",
              ),
              const SizedBox(
                height: 32,
              ),
              ServiceBox(
                onTap: () {
                  context.pushRoute(const HomeServicesRoute());
                },
                icon: Icons.home_filled,
                title: "Home Servizes",
                image:
                    'https://images.unsplash.com/photo-1605214178469-178b98bb29fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80',
                desc: "Let meet in person and help you",
              ),
              //   Container(
              //   decoration: BoxDecoration(
              //     color: primaryColorLight,
              //     borderRadius: BorderRadius.circular(16),

              //   ),

              //   child: ListTile(
              //     leading: Icon(LineIcons.home),
              //     title: Text("Home Offers", style: _theme.headline3,),
              //     trailing: Icon(Icons.arrow_forward_ios),
              //     // onTap: ()=> context.pushRoute(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
