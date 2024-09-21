import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/BottomSheets/FundreAiAttachImageBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/BottomSheets/FundreAiTextPromtBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/BottomSheets/FundreAiVoicePromtBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/CustomDivider.dart';
import '../../Repo/ImageRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';

class FundreAiWelcomeBottomSheetWidget extends StatefulWidget {
  const FundreAiWelcomeBottomSheetWidget({super.key});

  @override
  State<FundreAiWelcomeBottomSheetWidget> createState() => _FundreAiWelcomeBottomSheetWidgetState();
}

class _FundreAiWelcomeBottomSheetWidgetState extends State<FundreAiWelcomeBottomSheetWidget> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _offsetAnimations;

  @override
  void initState() {
    super.initState();

    // Initialize the lists
    _controllers = List.generate(3, (index) => AnimationController(
      duration: Duration(milliseconds: 1000 + (index * 500)),
      vsync: this,
    ));

    _offsetAnimations = List.generate(3, (index) => Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controllers[index],
      curve: Curves.easeInOut,
    )));

    // Start the animations
    for (var controller in _controllers) {
      controller.forward();
    }
  }

  @override
  void dispose() {
    // Dispose of all controllers
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _navigateTo(int screen) {
    switch (screen) {
      case 0:
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const FundreAiTextPromtBottomSheetWidget(),
        );
        break;
      case 1:
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const FundreAiVoicePromtBottomSheetWidget(),
        );
        break;
      case 2:
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const FundreAiAttachImageBottomSheetWidget(),
        );
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: SizedBox(
          height: 717,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomSheetHandle(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Text(
                      ScreenContext.exitText,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorRepo.dark,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(ImageRepo.fundreAiLogoMain, height: 20,),
                      const SizedBox(width: 5),
                      Text(
                        ListRepo.companyInfo[0]["AI-Name"],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: ColorRepo.dark,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 56,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Image.asset(ImageRepo.fundreAiLogoMain, height: 56,),
              const SizedBox(height: 40),
              Text(
                ScreenContext.headerText[0],
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: ColorRepo.dark,
                  fontFamily: 'MadeGentle',
                  fontWeight: FontWeight.normal,
                  fontSize: 27,
                ),
              ),
              Text(
                ScreenContext.bodyText[0],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorRepo.muted,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 40),
              SlideTransition(
                position: _offsetAnimations[0],
                child: GestureDetector(
                  onTap: (){
                    _navigateTo(0);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(ImageRepo.chatLineIcon, height: 56,),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ScreenContext.headerText[1],
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: ColorRepo.dark,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.55,
                                child: Text(
                                  ScreenContext.bodyText[1],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: ColorRepo.muted,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],),
                      const Icon(
                        PhosphorIcons.caret_right,
                        color: ColorRepo.dark,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const CustomDivider(),
              const SizedBox(height: 20,),
              SlideTransition(
                position: _offsetAnimations[1],
                child: GestureDetector(
                  onTap: (){
                    _navigateTo(1);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(ImageRepo.userSoundIcon, height: 56,),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ScreenContext.headerText[2],
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: ColorRepo.dark,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.55,
                                child: Text(
                                  ScreenContext.bodyText[2],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: ColorRepo.muted,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],),
                      const Icon(
                        PhosphorIcons.caret_right,
                        color: ColorRepo.dark,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const CustomDivider(),
              const SizedBox(height: 20,),
              SlideTransition(
                position: _offsetAnimations[2],
                child: GestureDetector(
                  onTap: (){
                    _navigateTo(2);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(ImageRepo.paperClipIcon, height: 56,),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ScreenContext.headerText[3],
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: ColorRepo.dark,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.55,
                                child: Text(
                                  ScreenContext.bodyText[3],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: ColorRepo.muted,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],),
                      const Icon(
                        PhosphorIcons.caret_right,
                        color: ColorRepo.dark,
                      ),
                    ],
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
  static const String exitText = "Cancel";
  static const String footerText = "Powered by";
  static List<String> headerText = ["Welcome to ${ListRepo.companyInfo[0]["AI-Name"]}", "Text prompts", "Voice prompts", "Attach Image"];
  static List<String> bodyText = ["Get started using ${ListRepo.companyInfo[0]["AI-Name"]} to order foodstuffs and our AI can do the rest. Not sure where to start?", "Type in prompts and ${ListRepo.companyInfo[0]["AI-Name-Short"]} will make it happen.", "make use of voice commands to ask Fundre and give prompts.", "Upload images of foodstuffs you want and ${ListRepo.companyInfo[0]["AI-Name"]} will order it."];
}
