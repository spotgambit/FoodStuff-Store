import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/AuthScreens/AccountVerificationScreen.dart';
import 'package:groceryshop/Screens/AuthScreens/SignIn.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'package:groceryshop/Widgets/PasswordInputWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/PasswordValidatorWidget.dart';
import '../../Widgets/PhoneNumberInputWidget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isMinimumCharacters = false;
  bool _hasUppercase = false;
  bool _hasSpecialCharacter = false;
  bool _isPasswordFieldEmpty = true;
  bool _enableBtn = false;
  bool _isValidPhoneNumber = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validatePhoneNumber);
    _passwordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    final password = _passwordController.text;
    setState(() {
      _isPasswordFieldEmpty = password.isEmpty;
      _isMinimumCharacters = password.length >= 8;
      _hasUppercase = StringFormatHelper.hasUppercase(password);
      _hasSpecialCharacter = StringFormatHelper.hasSpecialCharacter(password);
      _enableContinueButton();
    });
  }

  void _validatePhoneNumber() {
    final phoneNumber = _phoneController.text;
    setState(() {
      _isValidPhoneNumber = StringFormatHelper.isValidPhoneNumber(phoneNumber);
      _enableContinueButton();
    });
  }

  void _enableContinueButton() {
    setState(() {
      _enableBtn = _isValidPhoneNumber &&
          _isMinimumCharacters &&
          _hasUppercase &&
          _hasSpecialCharacter;
    });
  }

  void _signUp() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AccountVerificationScreen(phoneNumber: _phoneController.text.trim(), isPasswordVerification: false)),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
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
              Text(
                ScreenContext.inputLabels[0],
                style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  color: ColorRepo.muted,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              PhoneNumberInputWidget(
                screenWidth: screenWidth,
                hintText: ScreenContext.inputPlaceholders[0],
                controller: _phoneController,
              ),
              const SizedBox(height: 40),
              Text(
                ScreenContext.inputLabels[1],
                style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                    color: ColorRepo.muted,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              PasswordInputWidget(
                screenWidth: screenWidth,
                hintText: ScreenContext.inputPlaceholders[1],
                controller: _passwordController,
              ),
              PasswordValidatorWidget(
                isMinimumCharacters: _isMinimumCharacters,
                hasUppercase: _hasUppercase,
                hasSpecialCharacter: _hasSpecialCharacter,
                isPasswordFieldEmpty: _isPasswordFieldEmpty,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: RadiiRepo.bottomSheetMidHeight,
        color: ColorRepo.background,
        child: Padding(
          padding: const EdgeInsets.all(RadiiRepo.screenPadding),
          child: Column(
            children: [
              SizedBox(
                width: screenWidth,
                child: ElevatedButton(
                  onPressed: _enableBtn ? _signUp : null,
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ScreenContext.bottomSheetText[0],
                      style: const TextStyle(
                        color: ColorRepo.dark,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const SignInScreen()),
                        );
                      },
                      child: Text(
                        ScreenContext.bottomSheetText[1],
                        style: const TextStyle(
                          color: ColorRepo.link,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
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
    'Create a new account',
  ];

  static const List<String> inputLabels = [
    'Phone number',
    'Create password',
  ];

  static const List<String> inputPlaceholders = [
    'Enter phone number',
    'Password',
  ];

  static const List<String> subHeaders = [
    'Provide the following details below.',
  ];

  static const List<String> alerts = [
    'Minimum 8 characters',
    'Uppercase',
    'At least 1 special character',
  ];

  static const List<String> btnText = [
    'Continue',
  ];

  static const List<String> bottomSheetText = [
    'Have an account?',
    'Login',
  ];
}
