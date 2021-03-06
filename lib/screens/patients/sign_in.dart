// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:heal_point/routes/route.gr.dart';
//import 'package:heal_point/screens/screens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'package:heal_point/utilities/palette.dart';
//import 'package:toast/toast.dart';
import 'package:auto_route/auto_route.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  // final key =
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final auth = ref.read(authProvider);
    // ToastContext().init(context);
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      key: _scaffoldkey,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogo(theme: theme),
                const SizedBox(height: 24),
                Text(
                  'Welcome back!',
                  style: theme.headline2,
                ),
                const SizedBox(height: 16),
                Text(
                  'Enter your email and password',
                  style: theme.bodyText2,
                ),
                const SizedBox(height: 48),
                AuthField(
                    validator:
                        RequiredValidator(errorText: 'email is required'),
                    theme: theme,
                    controller: phoneController,
                    hint: 'enter your phone email',
                    icon: const Icon(
                      LineIcons.mobilePhone,
                    ),
                    label: 'email',
                    obscureText: false),
                AuthField(
                    validator:
                    MultiValidator([

                        RequiredValidator(errorText: 'email is required'),
                        EmailValidator(errorText: 'enter a correct email'),
                    ]),
                    theme: theme,
                    controller: passwordController,
                    hint: 'enter your password',
                    icon: const Icon(
                      Icons.password,
                    ),
                    label: 'password',
                    obscureText: true),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text("Forgot password?", style: theme.bodyText1),
                  ],
                ),
                const SizedBox(height: 24),
                AuthButton(
                  onTap: ()async {
                    // Navigator.pushNhone, pass: pass)
                    // context.p
                   if( await auth.signInUser(mail: phoneController.text, pass: passwordController.text)){
                    context.pushRoute(HomeRouter());
                   }
                  },
                  label: "Login",
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => context.pushRoute(const SignUpRouter()),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: theme.bodyText1),
                      Text("Register Now!",
                          style: theme.bodyText1?.copyWith(
                            color: primaryColorLight,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(children: const <Widget>[
                  Expanded(child: Divider()),
                  Text("OR"),
                  Expanded(child: Divider()),
                ]),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                    onPressed: () async {
                      await auth.signInWithGoogle(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => HealPoint()));

                      // Toast.show(
                      //   "Somethin must kill a man",
                      // backgroundColor: errorColor,
                      // duration: Toast.lengthShort,
                      // );
                    },
                    icon: const Icon(LineIcons.googleLogo),
                    label: const Text("Connect with Google")),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      context.pushRoute(const DoctorSignInRoute());
                    },
                    icon: const Icon(
                      LineIcons.doctor,
                      color: Colors.white,
                    ),
                    label: const Text("Connect As Doctor")),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    onPressed: () {
                      context.pushRoute(const NurseSignInRoute());
                    },
                    icon: const Icon(
                      LineIcons.nurse,
                      color: Colors.white,
                    ),
                    label: const Text("Connect As Nurse")),
              ],
            ),
          ),
        ), //
      ),
    );
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }
}
