import 'package:flutter/material.dart';
import 'package:heal_point/routes/route.gr.dart';
import 'package:heal_point/screens/screens.dart';
import 'package:heal_point/utilities/utilities.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';
import 'package:toast/toast.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';

class PhoneVerificationPage extends ConsumerStatefulWidget {
  const PhoneVerificationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PhoneVerificationState();
}

class _PhoneVerificationState extends ConsumerState<PhoneVerificationPage> {
  @override
  Widget build(BuildContext context) {
    final otpVisibility = ref.watch(otpVisibilityProvider.state);
    final _auth = ref.read(authProvider.state);
    final _theme = Theme.of(context).textTheme;
    final _fireAuth = ref.read(firebaseAuthProvider);
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
                visible: otpVisibility.state,
              ),
              const SizedBox(
                height: 10,
              ),
              AuthButton(
                theme: _theme,
                onTap: () async {
                  if (otpVisibility.state) {
                    if (await _auth.state.verifyOTP()) {
                      // Toast.show(
                      //   "Phone Verified SuccessFully",
                      //   backgroundColor: Colors.green,
                      //   duration: Toast.lengthShort,
                      // );
                      // Navigator.pushNamed(context, "/heal");
                      context.pushRoute(RootRouter());
                      
                    }
                  } else {
                    await _auth.state.loginWithPhone(phoneNumber, context);
                    // otpVisibility.state = !otpVisibility.state;
                  }
                },
                label: otpVisibility.state ? "Welcome" : "Verify",
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
    );
  }
}
