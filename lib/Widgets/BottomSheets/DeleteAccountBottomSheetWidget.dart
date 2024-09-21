import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';
import 'MembershipAgreementBottomSheetWidget.dart';

class DeleteAccountBottomSheetWidget extends StatefulWidget {
  final String previousScreen;
  const DeleteAccountBottomSheetWidget({super.key, this.previousScreen = ""});

  @override
  State<DeleteAccountBottomSheetWidget> createState() => _DeleteAccountBottomSheetWidgetState();
}

class _DeleteAccountBottomSheetWidgetState extends State<DeleteAccountBottomSheetWidget> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: SizedBox(
          height: 360,
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
                  Row(
                    children: [
                      const Icon(PhosphorIcons.smiley_x_eyes, color: ColorRepo.primary2, size: 50),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: screenWidth * 0.70,
                        child: Text(
                          ScreenContext.bodyText[0],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    ScreenContext.bodyText[1],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
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
  static const String appBarText = "Delete account";
  static const List<String> bodyText = ["Are you sure you want to delete this account? We’ll miss you.", "Click “Yes, delete account” in order to submit your request. A confirmation mail will be sent to you after submitting your request."];
  static const List<String> buttonText = ["I'm statying", "Yes, delete account"];
}
