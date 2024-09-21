import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/AuthScreens/AccountVerificationScreen.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'dart:ui';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/PhoneNumberInputWidget.dart';

class ChangePhoneNumberScreen extends StatefulWidget {
  const ChangePhoneNumberScreen({super.key});

  @override
  State<ChangePhoneNumberScreen> createState() => _ChangePhoneNumberScreenState();
}

class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _phone2Controller = TextEditingController();

  bool _isBtnEnabled = false;
  bool _isValidPhoneNumber = false;
  bool _isValidPhoneNumber2 = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validatePhoneNumber);
    _phone2Controller.addListener(_validatePhoneNumber);
  }

  void _validatePhoneNumber() {
    final phoneNumber = _phoneController.text;
    final phoneNumber2 = _phone2Controller.text;
    setState(() {
      _isValidPhoneNumber = StringFormatHelper.isValidPhoneNumber(phoneNumber);
      _isValidPhoneNumber2 = StringFormatHelper.isValidPhoneNumber(phoneNumber2);

      if(_isValidPhoneNumber && _isValidPhoneNumber2 && phoneNumber != phoneNumber2){
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
    _phoneController.dispose();
    _phone2Controller.dispose();
    super.dispose();
  }

  void _changePhoneNumber(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AccountVerificationScreen(value: _phone2Controller.text, verificationType: 'phone')),
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
                    PhoneNumberInputWidget(
                      screenWidth: screenWidth,
                      hintText: '',
                      controller: _phoneController,
                      isValid: _isValidPhoneNumber,
                    ),
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
                    PhoneNumberInputWidget(
                      screenWidth: screenWidth,
                      hintText: '',
                      controller: _phone2Controller,
                      isValid: _isValidPhoneNumber2
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
                          onPressed: _changePhoneNumber,
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
  static String pageTitle = 'Change Phone Number';
  static String bodyText = 'Kindly provide the correct details below.';
  static List<String> labelText = ['Old Phone number', 'New Phone number'];
  static String btnText = 'Continue';
}
