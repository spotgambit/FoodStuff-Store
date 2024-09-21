import 'dart:async';
import 'package:flutter/material.dart';
import 'package:groceryshop/Screens/SettingsScreens/SettingsScreen.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import 'CompleteProfileScreen.dart';
import 'CreateNewPasswordScreen.dart';

class AccountVerificationScreen extends StatefulWidget {
  //Value is the phone number or email that needs to be verified
  final String value;
  final String verificationType;

  const AccountVerificationScreen({super.key, required this.value, required this.verificationType});

  @override
  State<AccountVerificationScreen> createState() => _AccountVerificationScreenState();
}

class _AccountVerificationScreenState extends State<AccountVerificationScreen> {
  bool _enableBtn = false;
  bool _isResendEnabled = false;
  int _seconds = 30;
  Timer? _timer;

  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  int _currentFocusIndex = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(_checkComplete);
      _focusNodes[i].addListener(() {
        setState(() {
          _currentFocusIndex = i;
        });
      });
    }
    _startTimer();
  }

  void _checkComplete() {
    setState(() {
      _enableBtn = _controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  void _verifyAccount() {
    switch(widget.verificationType){
      case 'password':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen()),
        );
        break;

      case 'account':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CompleteProfileScreen()),
        );
        break;

        case 'phone':
          Navigator.of(context).popUntil(ModalRoute.withName('/settings'));
        break;

      case 'email':
        Navigator.of(context).popUntil(ModalRoute.withName('/settings'));
        break;
    }
  }

  void _startTimer() {
    _isResendEnabled = false;
    _seconds = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _isResendEnabled = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
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
                  color: ColorRepo.dark
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(
                '${ScreenContext.subHeaders[0]} ${StringFormatHelper.formatObscureContactInfo(widget.value)}',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: screenWidth * 0.045,
                  color: ColorRepo.muted,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    height: screenWidth * 0.14,
                    width: screenWidth * 0.14,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: _currentFocusIndex == index ? ColorRepo.background : ColorRepo.mutedLite,
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: _currentFocusIndex == index ? ColorRepo.secondary : ColorRepo.transparent,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: _currentFocusIndex == index ? ColorRepo.secondary : ColorRepo.transparent,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1 && index < 5) {
                          FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                        }
                        if (value.isEmpty && index > 0) {
                          FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: _isResendEnabled ? _startTimer : null,
                child: Text(
                  _isResendEnabled ? ScreenContext.linkText[0] : 'Resend Code in $_seconds',
                  style: TextStyle(
                    color: _isResendEnabled ? ColorRepo.link : Colors.grey,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
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
                  onPressed: _enableBtn ? _verifyAccount : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _enableBtn ? ColorRepo.primary : ColorRepo.muted,
                    padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                    ),
                  ),
                  child: Text(
                    ScreenContext.button[0],
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
    'Account verification',
  ];

  static const List<String> subHeaders = [
    'Enter the 6-digit verification code sent to you at',
  ];

  static const List<String> linkText = [
    'Resend Code',
  ];

  static const List<String> button = [
    'Continue',
  ];
}
