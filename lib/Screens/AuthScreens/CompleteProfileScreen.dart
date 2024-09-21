import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/AuthScreens/SignIn.dart';
import 'package:groceryshop/Widgets/EmailInputWidget.dart';
import 'package:groceryshop/Widgets/RegularInputWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Utils/StringFormatterHelper.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool _isFirstNameValid = false;
  bool _isLastNameValid = false;
  bool _isEmailAddressValid = false;
  bool _isResidentialAddressValid = false;

  bool _enableBtn = false;

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_enableContinueButton);
    _lastNameController.addListener(_enableContinueButton);
    _emailController.addListener(_enableContinueButton);
    _addressController.addListener(_enableContinueButton);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  bool _validateFirstName(String name) {
    return name.isNotEmpty && !name.contains(' ') && name.length > 1;
  }

  bool _validateLastName(String name) {
    return name.isNotEmpty && !name.contains(' ') && name.length > 1;
  }

  bool _validateEmail(String email) {
    return StringFormatHelper.validateEmail(email);
  }

  bool _validateAddress(String address) {
    return address.isNotEmpty && address.length > 5;
  }

  void _enableContinueButton() {
    setState(() {
      _isFirstNameValid = _validateFirstName(_firstNameController.text);
      _isLastNameValid = _validateLastName(_lastNameController.text);
      _isEmailAddressValid = _validateEmail(_emailController.text);
      _isResidentialAddressValid = _validateAddress(_addressController.text);

      _enableBtn = _isFirstNameValid &&
          _isLastNameValid &&
          _isEmailAddressValid &&
          _isResidentialAddressValid;
    });
  }

  void _completeProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  void _openTermsOfService() {
    // Open terms of service logic
  }

  void _openPrivacyPolicy() {
    // Open privacy policy logic
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
                  SizedBox(
                    width: screenWidth * 0.42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(height: 10),
                        RegularInputWidget(
                          screenWidth: screenWidth * 0.45,
                          hintText: ScreenContext.inputPlaceholders[0],
                          controller: _firstNameController,
                          prefixIcon: const Icon(
                            PhosphorIcons.user,
                            size: 24,
                          ),
                          isValid: _isFirstNameValid,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: screenWidth * 0.42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        RegularInputWidget(
                          screenWidth: screenWidth * 0.45,
                          hintText: ScreenContext.inputPlaceholders[0],
                          controller: _lastNameController,
                          prefixIcon: const Icon(
                            PhosphorIcons.user,
                            size: 24,
                          ),
                          isValid: _isLastNameValid,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                ScreenContext.inputLabels[2],
                style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  color: ColorRepo.muted,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              EmailInputWidget(
                screenWidth: screenWidth,
                hintText: ScreenContext.inputPlaceholders[1],
                controller: _emailController,
                isValid: _isEmailAddressValid,
              ),
              const SizedBox(height: 20),
              Text(
                ScreenContext.inputLabels[3],
                style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  color: ColorRepo.muted,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              RegularInputWidget(
                screenWidth: screenWidth,
                hintText: ScreenContext.inputPlaceholders[2],
                controller: _addressController,
                prefixIcon: const Icon(
                  PhosphorIcons.map_pin,
                  size: 24,
                ),
                isValid: _isResidentialAddressValid,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: RadiiRepo.bottomSheetMaxHeight,
        color: ColorRepo.background,
        child: Padding(
          padding: const EdgeInsets.all(RadiiRepo.screenPadding),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: ScreenContext.terms[0],
                    style: const TextStyle(
                      color: ColorRepo.muted,
                      fontFamily: 'Urbanist',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms of Services',
                        style: const TextStyle(
                          color: ColorRepo.link,
                          fontFamily: 'Urbanist',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _openTermsOfService,
                      ),
                      const TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          color: ColorRepo.muted,
                          fontFamily: 'Urbanist',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          color: ColorRepo.link,
                          fontFamily: 'Urbanist',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _openPrivacyPolicy,
                      ),
                      TextSpan(
                        text: ScreenContext.terms[1],
                        style: const TextStyle(
                          color: ColorRepo.muted,
                          fontFamily: 'Urbanist',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth,
                child: ElevatedButton(
                  onPressed: _enableBtn ? _completeProfile : null,
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
    'Complete Profile Screen',
  ];

  static const List<String> inputLabels = [
    'First name',
    'Last name',
    'Email address',
    'Residential address',
  ];

  static const List<String> inputPlaceholders = [
    'Your name',
    'example@gmail.com',
    'House no, Street, City, State, and Zip code',
  ];

  static const List<String> subHeaders = [
    'Please provide the following details correctly.',
  ];

  static const List<String> btnText = [
    'Continue',
  ];

  static const List<String> terms = [
    'By continuing, I agree to the ',
    ', including consent to SMS and electronic communications and for Foodstuff Store and its bank partner(s) to obtain and use my consumer reports.',
    'Already have an account?',
    'Login',
  ];
}
