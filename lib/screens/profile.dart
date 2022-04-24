import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
           children: const [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
              ),
              Text('Mr. John Doe', style: GoogleFonts.lato(color),),
            ],
      ),
        ),
      ),
    );
  }
}