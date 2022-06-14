// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:heal_point/utilities/palette.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/profile_menu_items.dart';

class DoctorProfilePage extends ConsumerWidget {
  const DoctorProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _auth = ref.read(authProvider);
    final _doctor = ref.read(doctorControllerProvider);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 250, 255),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: secondaryColor,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Icon(Icons.settings, color: secondaryColor, size: 30),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'profile',
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage('assets/images/profile_pic.jpg'),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 20),
                  Text(
                    'Mr. ${_doctor.name}',
                    style: GoogleFonts.lato(
                      color: Color(0xff03045e),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    _doctor.email,
                    style: GoogleFonts.lato(
                      color: Color(0xff03045e),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: secondaryColorLight,
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
                    text: 'Prescriptions',
                    icon: Icons.book,
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
                  GestureDetector(
                    onTap: () async => await _auth.signOut(context),
                    child: ProfileMenuItem(
                      text: 'Logout',
                      icon: Icons.logout,
                      arrowShown: false,
                    ),
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
