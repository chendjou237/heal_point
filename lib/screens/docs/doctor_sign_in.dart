import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:heal_point/routes/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:auto_route/auto_route.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class DoctorSignInPage extends ConsumerStatefulWidget {
  const DoctorSignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DoctorSignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<DoctorSignInPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  // final key =
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final auth = ref.read(authProvider);
    // ToastContext().init(context);
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
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
                  'Welcome back! Doctor',
                  style: theme.headline2,
                ),
                const SizedBox(height: 16),
                Text(
                  'Enter your phone number and password',
                  style: theme.bodyText2,
                ),
                const SizedBox(height: 48),
                AuthField(
                    validator:
                        RequiredValidator(errorText: 'password is required'),
                    theme: theme,
                    controller: _emailController,
                    hint: 'enter your email number',
                    icon: const Icon(
                      Icons.mail,
                    ),
                    label: 'email',
                    obscureText: false),
                AuthField(
                    validator:
                        RequiredValidator(errorText: 'password is required'),
                    theme: theme,
                    controller: _passwordController,
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
                  theme: theme,
                  onTap: () async {
                    if (await ref.read(authProvider.state).state.signInDoc(
                        mail: _emailController.text,
                        pass: _passwordController.text)) {
                      AutoRouter.of(context).push(const DoctorScreensRouter());
                    } else
                      print('something went wrong');
                  },
                  label: "Login",
                ),
              ],
            ),
          ),
        ), //
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
