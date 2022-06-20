// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:heal_point/providers/providers.dart';
import 'package:heal_point/screens/screens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
//import 'package:toast/toast.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class PasswordPage extends ConsumerStatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PasswordPage> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final _theme = Theme.of(context).textTheme;
    final _formKey = GlobalKey<FormState>();
    final name = ref.read(nameProvider.state);
    final email = ref.read(emailProvider.state);
    final phone = ref.read(phoneProvider.state);
    final auth = ref.read(authProvider);
    final db = ref.read(databaseProvider);
    final fireAuth = ref.read(firebaseAuthProvider);

    // final = ref.read(fire);
    // ToastContext().init(context);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Security Information',
                  style: _theme.headline1,
                ),
                const SizedBox(height: 24),
                Text(
                  'Welcome Among us ${name.state}!',
                  style: _theme.headline2,
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter A Strong password to keep your Account save',
                  style: _theme.bodyText2,
                ),
                const SizedBox(height: 24),
                AuthField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'password is required'),
                    MinLengthValidator(8,
                        errorText: 'password must be at least 8 digits long'),
                    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                        errorText:
                            'passwords must have at least one special character')
                  ]),
                  theme: _theme,
                  controller: passwordController,
                  hint: 'enter your password',
                  icon: const Icon(
                    LineIcons.lock,
                  ),
                  label: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                AuthField(
                  validator: (val) =>
                      MatchValidator(errorText: 'passwords do not match')
                          .validateMatch(val!, passwordController.text),
                  theme: _theme,
                  controller: confirmPasswordController,
                  hint: 'Confirm your password',
                  icon: const Icon(
                    LineIcons.userLock,
                  ),
                  label: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                AuthButton(
               
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      // Toast.show(
                      //   "Password Verified SuccessFully",
                      //   backgroundColor: Colors.green,
                      //   duration: Toast.lengthShort,
                      // );
                      try {
                     

                        await auth.signupUser(
                          mail: email.state,
                          context: context,
                          pass: passwordController.text,
                          patient: Patient(
                            email: email.state,
                            
                            names: name.state,
                            phoneNumber: phone.state,
                          ),
                        );
                        // Navigator.pushNamed(context, "/heal");
                        // Toast.show(
                        //   "Something went wrong ",
                        //   backgroundColor: Colors.red,
                        //   duration: Toast.lengthShort,
                        // );
                        
                      } on FirebaseAuthException catch (e) {
                        throw e.message ?? e.toString();
                      }
                    }
                  },
                  label: "Next",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
