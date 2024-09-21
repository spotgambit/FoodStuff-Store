import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/AuthScreens/AccountVerificationScreen.dart';
import 'package:groceryshop/Screens/AuthScreens/SignIn.dart';
import 'package:groceryshop/Widgets/EmailInputWidget.dart';
import 'package:groceryshop/Widgets/RegularInputWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Utils/StringFormatterHelper.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  bool _isEmailAddressValid = false;

  bool _enableBtn = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_enableContinueButton);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _validateEmail(String email) {
    return StringFormatHelper.validateEmail(email);
  }

  void _enableContinueButton() {
    setState(() {
      _isEmailAddressValid = _validateEmail(_emailController.text);

      _enableBtn =
          _isEmailAddressValid;
    });
  }

  void _verifyEmail() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AccountVerificationScreen(value: _emailController.text.trim(), verificationType: "password")),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Padding(
          padding: const EdgeInsets.only(
            top: RadiiRepo.whenNoAppBarUnderPadding,
            left: RadiiRepo.screenPadding,
            right: RadiiRepo.screenPadding,
            bottom: 100, // Ensures space for the button
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ScreenContext.headers[0],
                  style: TextStyle(
                    fontFamily: 'MadeGentle',
                    fontSize: screenWidth * 0.060,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                Text(
                  ScreenContext.subHeaders[0],
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: screenWidth * 0.045,
                    color: ColorRepo.muted,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ScreenContext.inputLabels[0],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.muted,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    EmailInputWidget(
                      screenWidth: screenWidth,
                      hintText: ScreenContext.inputPlaceholders[0],
                      controller: _emailController,
                      isValid: _isEmailAddressValid,
                    ),
                  ],
                ),
              ]
          ),
        ),),
      bottomSheet: Container(
        height: RadiiRepo.bottomSheetMaxHeight,
        color: ColorRepo.background,
        child: Padding(
          padding: const EdgeInsets.all(RadiiRepo.screenPadding),
          child: Column(
            children: [
              SizedBox(
                width: screenWidth,
                child: ElevatedButton(
                  onPressed: _enableBtn ? _verifyEmail : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _enableBtn ? ColorRepo.primary : ColorRepo.muted,
                    padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                    ),
                  ),
                  child: Text(
                    ScreenContext.btnText[0],
                    style: TextStyle(
                      color: _enableBtn ? ColorRepo.background : ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static const List<String> headers = [
    'Email verification',
  ];

  static const List<String> inputLabels = [
    'Email address',
  ];

  static const List<String> inputPlaceholders = [
    'example@gmail.com',
  ];

  static const List<String> subHeaders = [
    ' kindly enter your email registered with account to receive the verification code.',
  ];

  static const List<String> btnText = [
    'Continue',
  ];
}
