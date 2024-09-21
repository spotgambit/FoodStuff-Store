import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';
import 'MembershipAgreementBottomSheetWidget.dart';

class PasswordUpdatedBottomSheetWidget extends StatefulWidget {
  final String previousScreen;
  const PasswordUpdatedBottomSheetWidget({super.key, this.previousScreen = ""});

  @override
  State<PasswordUpdatedBottomSheetWidget> createState() => _PasswordUpdatedBottomSheetWidgetState();
}

class _PasswordUpdatedBottomSheetWidgetState extends State<PasswordUpdatedBottomSheetWidget> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: RadiiRepo.successBottomSheetHeight,
        width: screenWidth,
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        decoration: BoxDecoration(
          color: ColorRepo.background,
          borderRadius: BorderRadius.circular(RadiiRepo.bottomSheetBorderRadius),
        ),
        child: Column(
          children: [
            BottomSheetHandle(),
            const SizedBox(height: 20,),
            const SizedBox(
              height: 130, // Adjusted height to fit both icons properly
              width: 100,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      PhosphorIcons.lock_laminated_fill,
                      color: ColorRepo.dark,
                      size: 70,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    bottom: 80,
                    left: 60,
                    right: 30,
                    child: Icon(
                      PhosphorIcons.checks,
                      color: ColorRepo.successDark,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              ScreenContext.bottomSheetText[3],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorRepo.successDark,
                fontFamily: 'MadeGentle',
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              ScreenContext.bottomSheetText[4],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorRepo.dark,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 80),
            InkWell(
              onTap: (){Navigator.pop(context);},
              child: Text(
                ScreenContext.linkText[0],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorRepo.primary,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
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
    'Password changed successfully!',
    'You have successfully changed password. Please use your new password to Login.',
  ];
}
