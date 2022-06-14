// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:heal_point/utilities/palette.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../widgets/profile_menu_items.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {

 File? _imageFile;

  ///NOTE: Only supported on Android & iOS
  ///Needs image_picker plugin {https://pub.dev/packages/image_picker}
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

   Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
        );
  }


  @override
  Widget build(BuildContext context) {
    final _auth = ref.read(authProvider);
    final _patient = ref.read(patientControllerProvider);
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
                    child: GestureDetector(
                      onTap: (){
                        pickImage();
                      
                      } ,
                      child: ClipRRect(
                        
                        child: _imageFile != null ? Image.file(_imageFile!,height: 30,width: 30,) : Image.asset('assets/images/profile_pic.jpg',height: 30,width: 30,)),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 20),
                  Text(
                    'Mr. ${_patient.names}',
                    style: GoogleFonts.lato(
                      color: Color(0xff03045e),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    _patient.email,
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
