import 'package:flutter/material.dart';
import 'package:groceryshop/Screens/AuthScreens/SignIn.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'package:groceryshop/Widgets/PasswordInputWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/CustomAppBarWidget.dart';
import '../../Widgets/PasswordMatchValidatorWidget.dart';
import '../../Widgets/PasswordValidatorWidget.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  bool _isMinimumCharacters = false;
  bool _hasUppercase = false;
  bool _hasSpecialCharacter = false;
  bool _isPasswordFieldEmpty = true;
  bool _passwordsMatch = false;
  bool _enableBtn = false;

  bool _showSuccessBottomSheet = false;

  _cancel() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePassword);
    _passwordController2.addListener(_validatePasswordMatch);
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

  void _validatePasswordMatch() {
    setState(() {
      if (_passwordController.text == _passwordController2.text) {
        _passwordsMatch = true;
      } else {
        _passwordsMatch = false;
      }
    });
    _enableContinueButton();
  }

  void _enableContinueButton() {
    setState(() {
      _enableBtn = _passwordsMatch &&
          _isMinimumCharacters &&
          _hasUppercase &&
          _hasSpecialCharacter;
    });
  }

  void _createPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignInScreen(showSuccessBottomSheet: true)),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      appBar: CustomAppBar(
        title: '',
        onCancel: _cancel,
        showTitle: false,
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
              const SizedBox(height: 60),
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
                controller: _passwordController2,
              ),
              PasswordMatchValidatorWidget(
                isMatch: _passwordsMatch,
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
                  onPressed: _enableBtn ? _createPassword : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _enableBtn
                        ? ColorRepo.primary
                        : ColorRepo.muted,
                    padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(RadiiRepo.borderRadius),
                    ),
                  ),
                  child: Text(
                    ScreenContext.btnText[0],
                    style: TextStyle(
                      color: _enableBtn
                          ? ColorRepo.background
                          : ColorRepo.dark,
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
    'Create a new password',
  ];

  static const List<String> inputLabels = [
    'Create password',
    'Confirm password',
  ];

  static const List<String> inputPlaceholders = [
    'Enter phone number',
    'Password',
  ];

  static const List<String> subHeaders = [
    'Your new password must be different from previous used password.',
  ];

  static const List<String> alerts = [
    'Minimum 8 characters',
    'Uppercase',
    'At least 1 special character',
  ];

  static const List<String> btnText = [
    'Reset password',
  ];

  static const List<String> linkText = [
    'Cancel',
    'Login',
  ];
}
