



import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:heal_point/screens/screens.dart';
import 'package:line_icons/line_icons.dart';
import 'package:toast/toast.dart';

import '../widgets/widgets.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final _theme = Theme.of(context).textTheme;
    final _formKey = GlobalKey<FormState>();
    String match = "";
    ToastContext().init(context);
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
                  'Welcome Among us $userName!',
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
                  theme: _theme,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Toast.show(
                        "Password Verified SuccessFully",
                        backgroundColor: Colors.green,
                        duration: Toast.lengthShort,
                      );
                      Navigator.pushNamed(context, "/home");
                    }
                  },
                  label: "Welcome",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

