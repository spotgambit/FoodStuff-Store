import 'package:flutter/material.dart';
import 'package:groceryshop/Screens/AuthScreens/SignUp.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'package:groceryshop/Widgets/BottomNavigationWidgetScreen.dart';
import 'package:groceryshop/Widgets/PasswordInputWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/BottomSheets/PasswordUpdatedBottomSheetWidget.dart';
import '../../Widgets/PhoneNumberInputWidget.dart';
import 'ForgotPasswordScreen.dart';

class SignInScreen extends StatefulWidget {
  final bool showPasswordSuccessBottomSheet;

  const SignInScreen({super.key, this.showPasswordSuccessBottomSheet = false});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isMinimumCharacters = false;
  bool _hasUppercase = false;
  bool _hasSpecialCharacter = false;
  bool _isBtnEnabled = false;
  bool _isValidPhoneNumber = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validatePhoneNumber);
    _passwordController.addListener(_validatePassword);

    if(widget.showPasswordSuccessBottomSheet){
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) => const PasswordUpdatedBottomSheetWidget(),
      );
    }
  }

  void _validatePassword() {
    final password = _passwordController.text;
    setState(() {
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
      _isBtnEnabled = _isValidPhoneNumber &&
          _isMinimumCharacters &&
          _hasUppercase &&
          _hasSpecialCharacter;
    });
  }

  void _signIn() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const BottomNavigationWidgetScreen()),
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: RadiiRepo.whenNoAppBarUnderPadding,
              left: RadiiRepo.screenPadding,
              right: RadiiRepo.screenPadding,
            ),
            child: SizedBox(
              width: screenWidth,
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
                    isValid: _isValidPhoneNumber,
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
                ],
              ),
            ),
          ),
          Positioned(
            top: null,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              key: const ValueKey(0),
              height: RadiiRepo.bottomSheetMaxHeight,
              color: ColorRepo.background,
              child: Padding(
                padding: const EdgeInsets.all(RadiiRepo.screenPadding),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                          );
                        },
                        child: Text(
                          ScreenContext.bottomSheetText[0],
                          style: const TextStyle(
                            color: ColorRepo.link,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline, // Underline the text
                            decorationColor: ColorRepo.link, // Set underline color to match text color
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth,
                      child: ElevatedButton(
                        onPressed: _isBtnEnabled ? _signIn : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isBtnEnabled ? ColorRepo.primary2 : ColorRepo.muted,
                          padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                          ),
                        ),
                        child: Text(
                          ScreenContext.btnText[0],
                          style: TextStyle(
                            color: _isBtnEnabled ? ColorRepo.background : ColorRepo.dark,
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
                            ScreenContext.bottomSheetText[1],
                            style: const TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 4),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const SignUpScreen()),
                              );
                            },
                            child: Text(
                              ScreenContext.bottomSheetText[2],
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
          ),
        ],
      ),
    );
  }
}

class ScreenContext {
  static const List<String> headers = [
    'Welcome back',
  ];

  static const List<String> inputLabels = [
    'Phone number',
    'Password',
  ];

  static const List<String> inputPlaceholders = [
    'Enter phone number',
    'Password',
  ];

  static const List<String> subHeaders = [
    'Login to continue shopping foodstuff.',
  ];

  static const List<String> btnText = [
    'Continue',
  ];

  static const List<String> linkText = [
    'Login',
  ];

  static const List<String> bottomSheetText = [
    'Forgot your password?',
    'Don\'t have an account?',
    'Sign Up',
  ];
}
