import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pinput/pinput.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';

import '../../models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';

final nameProvider = StateProvider((_) => "");
final phoneProvider = StateProvider((_) => "");
final emailProvider = StateProvider((_) => "");

class SignUpPage extends ConsumerStatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

String verificationID = "";
final otpVisibilityProvider = StateProvider((_) => false);
TextEditingController otpController = TextEditingController();

class _SignUpState extends ConsumerState<SignUpPage> {
  TextEditingController phoneController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final otpVisibility = ref.watch(otpVisibilityProvider.state);
    final _auth = ref.read(authProvider.state);
    final _nameController = TextEditingController();
   
    final _theme = Theme.of(context).textTheme;
    String phoneNumber = '';
    final email = ref.read(emailProvider.state);
    final name = ref.read(nameProvider.state);
    final _formKey = GlobalKey<FormState>();

    final _emailController = TextEditingController();
    // final patient = ref.read(authPatientProvider.state);
    final _fireAuth = ref.read(firebaseAuthProvider);
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
          child: Form(
            key: _formKey,
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
                  'Enter your name and email to continue',
                  style: _theme.bodyText2,
                ),
                const SizedBox(height: 24),
                AuthField(
                  validator:
                      RequiredValidator(errorText: 'password is required'),
                  theme: _theme,
                  controller: _nameController,
                  hint: 'enter your name',
                  icon: const Icon(
                    LineIcons.user,
                  ),
                  label: 'name',
                  obscureText: false,
                ),
                AuthField(
                  validator:
                      EmailValidator(errorText: "the email is not valid"),
                  theme: _theme,
                  controller: _emailController,
                  hint: 'enter your email',
                  icon: const Icon(
                    LineIcons.envelope,
                  ),
                  label: 'email',
                  obscureText: false,
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(
                  onTap: () async {
                    //  ToastContext().init(context);
                    if (_formKey.currentState!.validate()) {
                      // Toast.show(
                      //   "Name and Email Verified SuccessFully",
                      //   backgroundColor: Colors.green,
                      //   duration: Toast.lengthShort,
                      // );
                      email.state = _emailController.text;
                      name.state = _nameController.text;
                      Navigator.pushNamed(context, "/password");
                    }
                    // Toast.show(
                    //   "Something went wrong ",
                    //   backgroundColor: Colors.red,
                    //   duration: Toast.lengthShort,
                    // );
                  },
                  label: "Next",
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
                        style: _theme.bodyText1?.copyWith(
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
      ),
    );
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  // Future<bool> loginWithPhone(String phoneNumber) async {
  //   bool response = false;
  //   print("The number to be input is $phoneNumber");
  //   auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await auth.signInWithCredential(credential);
  //       Navigator.pushNamed(context, "/password");
  //       response = true;
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       print(e.message);
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       otpVisibility = true;
  //       verificationID = verificationId;
  //       setState(() {});
  //       response = true;
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  //   return response;
  // }

  // Future<bool> verifyOTP() async {
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationID, smsCode: otpController.text);
  //   try {
  //     await auth.signInWithCredential(credential).then(
  //       (value) {
  //         print("You are logged in successfully");

  //         Toast.show(
  //           "You are logged in successfully",
  //           backgroundColor: Colors.green,
  //           duration: Toast.lengthShort,
  //         );
  //       },
  //     );
  //     return true;
  //   } on FirebaseException catch (e) {
  //     print("this is the message return by firebase: ${e.message}");
  //     return false;
  //   }
}
