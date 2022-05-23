import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/utilities.dart';

class ProfileMenuItem extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  ProfileMenuItem(
      {required this.text, required this.icon, required this.arrowShown});
  final String text;
  final IconData icon;
  final bool arrowShown;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
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
                text,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          arrowShown
              ? Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child:
                      Icon(Icons.arrow_forward, size: 30, color: Colors.white),
                )
              : Container(),
        ],
      ),
    );
  }
}
