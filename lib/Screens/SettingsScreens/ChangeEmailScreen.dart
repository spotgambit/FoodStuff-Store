import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/AuthScreens/AccountVerificationScreen.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'dart:ui';

import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/EmailInputWidget.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _email2Controller = TextEditingController();

  String userEmail = "bomadokubo@gmail.com";
  bool isEmailVerified = true;

  bool _isBtnEnabled = false;
  bool _isValidEmailAddress = false;

  @override
  void initState() {
    super.initState();
    _emailController.text = userEmail;
    _email2Controller.addListener(_validateEmailAddress);
  }

  void _validateEmailAddress() {
    final email = _emailController.text;
    final email2 = _email2Controller.text;
    setState(() {
      _isValidEmailAddress = StringFormatHelper.validateEmail(email2);

      if(_isValidEmailAddress && email != email2){
        _enableContinueButton();
      }
    });
  }

  void _enableContinueButton() {
    setState(() {
      _isBtnEnabled = true;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _email2Controller.dispose();
    super.dispose();
  }

  void _changeEmailAddress(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AccountVerificationScreen(value: _email2Controller.text, verificationType: 'email')),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
        title: Text(
          ScreenContext.pageTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorRepo.dark,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: screenHeight,
              width: screenWidth, // Adjust the width to allow horizontal scrolling
              child: Padding(
                padding: const EdgeInsets.only(
                  left: RadiiRepo.screenPadding,
                  right: RadiiRepo.screenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ScreenContext.bodyText,
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        color: ColorRepo.muted,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      ScreenContext.labelText[0],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.muted,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    EmailInputWidget(
                      screenWidth: screenWidth,
                      hintText: ScreenContext.inputPlaceholderText,
                      controller: _emailController,
                      isValid: StringFormatHelper.validateEmail(_emailController.text),
                    ),
                    const SizedBox(height: 5),
                    isEmailVerified ? const Row(children: [ Icon(
                      PhosphorIcons.check_circle_fill,
                      color: ColorRepo.success,
                      size: 21,
                    ),  SizedBox(width: 5), Text(
                      'Verified',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.success,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),],) : const SizedBox(),
                    const SizedBox(height: 20),
                    Text(
                      ScreenContext.labelText[1],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.muted,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    EmailInputWidget(
                      screenWidth: screenWidth,
                      hintText: ScreenContext.inputPlaceholderText,
                      controller: _email2Controller,
                      isValid: _isValidEmailAddress,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                height: RadiiRepo.bottomSheetLiteHeight,
                color: ColorRepo.background,
                child: Padding(
                  padding: const EdgeInsets.all(RadiiRepo.screenPadding),
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth - 30,
                        child: ElevatedButton(
                          onPressed: _changeEmailAddress,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isBtnEnabled ? ColorRepo.primary2 : ColorRepo.muted2,
                            padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                            ),
                          ),
                          child: Text(
                            ScreenContext.btnText,
                            style: TextStyle(
                              color: _isBtnEnabled ? ColorRepo.background : ColorRepo.dark,
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
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenContext {
  static String pageTitle = 'Email address';
  static String bodyText = 'Kindly provide the correct details below.';
  static List<String> labelText = ['Email address', 'New Email address'];
  static String inputPlaceholderText = 'example@gmail.com';
  static String btnText = 'Continue';
}
