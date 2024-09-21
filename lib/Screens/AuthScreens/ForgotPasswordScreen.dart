import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/AuthScreens/VerifyEmailScreen.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import 'AccountVerificationScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  void _resetPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const VerifyEmailScreen()),
    );
  }

  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      appBar: AppBar(
        backgroundColor: ColorRepo.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(PhosphorIcons.arrow_left, color: ColorRepo.dark),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Padding(
          padding: const EdgeInsets.only(
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
              const SizedBox(height: 40),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _selectedOption = 0;
                  });
                },
                child: Container(
                  height: 110,
                  width: screenWidth,
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.80, color: _selectedOption == 0 ? ColorRepo.primary : ColorRepo.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(_selectedOption == 0 ? PhosphorIcons.check_circle_fill : PhosphorIcons.circle, color: ColorRepo.dark),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                              Text(
                                ScreenContext.optionTexts[0],
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: screenWidth * 0.045,
                                  color: ColorRepo.dark,
                                  fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(width: 5,),
                              const Icon(PhosphorIcons.envelope_simple, color: ColorRepo.dark),
                            ],),
                            SizedBox(
                              width: screenWidth - 100,
                              child: Text(
                                ScreenContext.optionTexts[1],
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: screenWidth * 0.045,
                                  color: ColorRepo.muted,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _selectedOption = 1;
                  });
                },
                child: Container(
                  height: 110,
                  width: screenWidth,
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.80, color: _selectedOption == 1 ? ColorRepo.primary : ColorRepo.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(_selectedOption == 1 ? PhosphorIcons.check_circle_fill : PhosphorIcons.circle, color: ColorRepo.dark),
                      const SizedBox(width: 10,),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  ScreenContext.optionTexts[2],
                                  style: TextStyle(
                                      fontFamily: 'Urbanist',
                                      fontSize: screenWidth * 0.045,
                                      color: ColorRepo.dark,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(width: 5,),
                                const Icon(PhosphorIcons.phone, color: ColorRepo.dark),
                              ],),
                            SizedBox(
                              width: screenWidth - 100,
                              child: Text(
                                ScreenContext.optionTexts[3],
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: screenWidth * 0.045,
                                  color: ColorRepo.muted,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: RadiiRepo.bottomSheetMinHeight,
        color: ColorRepo.background,
        child: Padding(
          padding: const EdgeInsets.all(RadiiRepo.screenPadding),
          child: Column(
            children: [
              SizedBox(
                width: screenWidth,
                child: ElevatedButton(
                  onPressed: _resetPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorRepo.primary,
                    padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                    ),
                  ),
                  child: Text(
                    ScreenContext.btnText[0],
                    style: const TextStyle(
                      color: ColorRepo.background,
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
    'Forgot password',
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
    'Do not worry! We will help you recover your password.',
  ];

  static const List<String> btnText = [
    'Continue',
  ];

  static const List<String> bottomSheetText = [
    'Don\'t have an account?',
    'Sign Up',
  ];

  static const List<String> optionTexts = [
    'Send to my email',
    'Get a security code Email to boma*****@gmail.com',
    'Send to my phone number',
    'Get a security code SMS to +234 81******78',
  ];
}
