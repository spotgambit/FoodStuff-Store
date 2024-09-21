import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';

class ConfirmMicroPhoneAccessBottomSheetWidget extends StatefulWidget {
  const ConfirmMicroPhoneAccessBottomSheetWidget({super.key});

  @override
  State<ConfirmMicroPhoneAccessBottomSheetWidget> createState() => _ConfirmMicroPhoneAccessBottomSheetWidgetState();
}

class _ConfirmMicroPhoneAccessBottomSheetWidgetState extends State<ConfirmMicroPhoneAccessBottomSheetWidget> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: SizedBox(
          height: 340,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  const SizedBox(height: 20),
                  const Icon(
                    PhosphorIcons.microphone,
                    color: ColorRepo.dark,
                    size: 48,
                  ),
                  const Text(
                    ScreenContext.labelText,
                    style: TextStyle(
                      color: ColorRepo.muted,
                      fontFamily: 'Urbanist',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      ScreenContext.headerText[0],
                      style: const TextStyle(
                        color: ColorRepo.muted,
                        fontFamily: 'Urbanist',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: screenWidth,
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth - 20,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context, true);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorRepo.primary2,
                            padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                            ),
                          ),
                          child: Text(
                            ScreenContext.buttonText[0],
                            style: const TextStyle(color: Colors.white, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: ScreenContext.bodyText,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 12
                          ),
                          children: [
                            TextSpan(
                              text: "Privacy Policy",
                              style: const TextStyle(
                                color: ColorRepo.link,  // Use the color defined in ColorRepo
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                  fontSize: 12
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                //Open web view with privacy policy
                                },
                            ),
                            const TextSpan(
                              text: ".",
                              style: TextStyle(
                                color: ColorRepo.dark,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                  fontSize: 12
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
  static const String appBarText = "Access Request";
  static const String labelText = "Allow microphone access";
  static const List<String> headerText = ["Give Fundre AI voice prompts",];
  static const String bodyText = "The microphone on your device will be turned on automatically. We store and use the audio transcripts. view ";
  static const List<String> buttonText = ["Continue"];
}
