import 'dart:ui';
import 'package:flutter/material.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';
import 'MembershipAgreementBottomSheetWidget.dart';

class LogOutBottomSheetWidget extends StatefulWidget {
  final String previousScreen;
  const LogOutBottomSheetWidget({super.key, this.previousScreen = ""});

  @override
  State<LogOutBottomSheetWidget> createState() => _LogOutBottomSheetWidgetState();
}

class _LogOutBottomSheetWidgetState extends State<LogOutBottomSheetWidget> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: SizedBox(
          height: 250,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BottomSheetHandle(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: screenWidth,
                    child: const Text(
                      ScreenContext.appBarText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorRepo.dark,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    ScreenContext.bodyText,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: screenWidth,
                  child: Row(children: [
                    SizedBox(
                      width: screenWidth * 0.44,
                      child: OutlinedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color:  ColorRepo.transparent),
                          padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                          ),
                        ),
                        child: Text(
                          ScreenContext.buttonText[0],
                          style: const TextStyle(color: ColorRepo.primary2, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.44,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorRepo.primary2,
                          padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                          ),
                        ),
                        child: Text(
                          ScreenContext.buttonText[1],
                          style: const TextStyle(color: Colors.white, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static const String appBarText = "Log Out";
  static const String bodyText = "Are you sure you want to log Out from your account?";
  static const List<String> buttonText = ["Cancel", "Yes, Logout"];
}
