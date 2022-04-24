// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body:  Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
            ), Positioned(
            top: 50,
            right: 20,
            child: Icon(Icons.settings, color: Colors.white, size: 30),
            ),
          Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              Text(
                'Mr. John Doe',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'John@gmail.com',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                height: 50,
                width: 500,
                child: Center(
                  child: Text(
                    'Upgrade to Premium',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ProfileMenuItem(
                text: 'Search history',
                 icon: Icons.search,
                  arrowShown: true,
                  ),
                  SizedBox(height: 20),
                    ProfileMenuItem(
                text: 'Language',
                 icon: Icons.language,
                  arrowShown: true,
                  ),
                  SizedBox(height: 20),
                    ProfileMenuItem(
                text: 'Help and support',
                 icon: Icons.help,
                  arrowShown: true,
                  ),
                  SizedBox(height: 20),
                    ProfileMenuItem(
                text: 'Logout',
                 icon: Icons.logout,
                  arrowShown: false,
                  ),
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ProfileMenuItem extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  ProfileMenuItem({required this.text, required this.icon, required this.arrowShown});
  final String text;
  final IconData icon;
  final bool arrowShown;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      height: 50,
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Icon(
                 icon,
                   size: 35,
                    color: Colors.white,
                    ),
              ),
              SizedBox(width: 10),
              Text(
                '$text',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          arrowShown ? Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.arrow_forward, 
              size: 30,
               color: Colors.white
               ),
          ): Container(), 
      
        ],
      ),
    );
  }
}
