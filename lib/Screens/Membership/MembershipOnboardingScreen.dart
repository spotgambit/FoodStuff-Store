import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/Membership/MembershipScreen.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ImageRepo.dart';
import '../../Repo/RadiiRepo.dart';

class MembershipOnboardingScreen extends StatefulWidget {
  const MembershipOnboardingScreen({super.key});

  @override
  State<MembershipOnboardingScreen> createState() => _MembershipOnboardingScreenState();
}

class _MembershipOnboardingScreenState extends State<MembershipOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorRepo.primary2,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            width: 280,
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            decoration: BoxDecoration(
              color: ColorRepo.transparent,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: ColorRepo.muted2,
                width: 1.0,
              ),
            ),
            child: Row(children: [
              const Icon(
                PhosphorIcons.crown_fill,
                color: ColorRepo.background,
                size: 14,
              ),
              const SizedBox(width: 4),
              Text(
                ScreenContext.labelText,
                style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 12,
                  color: ColorRepo.background,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            ],),
          ),
        ),
        Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Image.asset(ImageRepo.membershipBG),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: Text(
              ScreenContext.headerText,
              style: const TextStyle(
                  fontFamily: 'MadeGentle',
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: ColorRepo.primaryLite
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              width: screenWidth - 20,
              child: OutlinedButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MembershipScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: ColorRepo.background),
                  padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                  ),
                ),
                child: Text(
                  ScreenContext.buttonText,
                  style: const TextStyle(color: ColorRepo.background, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
      ],)
    );
  }
}

class ScreenContext{
  static String headerText = "Welcome to Foodstuff Sore Premium";
  static String labelText = "Congrats, Now Premium. +200 points gained";
  static String buttonText = "Get shopping";
}
