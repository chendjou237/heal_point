import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pinput/pinput.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';

import '../utilities/utilities.dart';
import '../widgets/widgets.dart';

var userName = "undefined";
final phoneNumberProvider = StateProvider((_) => '');


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    ToastContext().init(context);
    final _theme = Theme.of(context).textTheme;
    String phoneNumber = '';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const FlutterLogo(),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Personal Info',
                style: _theme.headline1,
              ),
              const SizedBox(height: 24),
              Text(
                'Hello!',
                style: _theme.headline2,
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your name and phone number to continue',
                style: _theme.bodyText2,
              ),
              const SizedBox(height: 24),
              AuthField(
                validator: RequiredValidator(errorText: 'password is required'),
                theme: _theme,
                controller: _nameController,
                hint: 'enter your name',
                icon: const Icon(
                  LineIcons.user,
                ),
                label: 'name',
                obscureText: false,
              ),
              const SizedBox(height: 16),
              IntlPhoneField(
                onSubmitted: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  phoneNumber = phone.completeNumber;
                  print(phoneNumber);
                },
              ),
              const SizedBox(height: 24),
              Visibility(
                child: Column(
                  children: [
                    Text(
                      "A code was sent to your phone number",
                      style: _theme.headline2,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Pinput(
                        controller: otpController,
                        length: 6,
                        onCompleted: (code) async {},
                        defaultPinTheme: PinTheme(
                          width: 56,
                          height: 56,
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(30, 60, 87, 1),
                              fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(234, 239, 243, 1)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                visible: otpVisibility,
              ),
              const SizedBox(
                height: 10,
              ),
              AuthButton(
                theme: _theme,
                onTap: () async {
                  userName = _nameController.text;
                  if (otpVisibility) {
                    if (await verifyOTP()) {
                      Toast.show(
                        "Phone Verified SuccessFully",
                        backgroundColor: Colors.green,
                        duration: Toast.lengthShort,
                      );
                      Navigator.pushNamed(context, "/password");
                    } else {
                      Toast.show(
                        "Something went wrong with verification",
                        backgroundColor: Colors.red,
                        duration: Toast.lengthShort,
                      );
                    }
                  } else {
                    loginWithPhone(phoneNumber);
                  }
                },
                label: otpVisibility ? "Next" : "Verify",
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text("Already have and account? ", style: _theme.bodyText1),
                  GestureDetector(
                    child: Text(
                      "Sign In",
                      style: _theme.bodyText1!.copyWith(
                        color: primaryColorLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(context, "/sign_in"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> loginWithPhone(String phoneNumber) async {
    bool response = false;
    print("The number to be input is $phoneNumber");
    auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        Navigator.pushNamed(context, "/password");
        response = true;
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
        response = true;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return response;
  }

  Future<bool> verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);
    try {
      await auth.signInWithCredential(credential).then(
        (value) {
          print("You are logged in successfully");

          Toast.show(
            "You are logged in successfully",
            backgroundColor: Colors.green,
            duration: Toast.lengthShort,
          );
        },
      );
      return true;
    } on FirebaseException catch (e) {
      print("this is the message return by firebase: ${e.message}");
      return false;
    }
  }
}
