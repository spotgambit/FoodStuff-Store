import 'dart:async';
import 'package:flutter/material.dart';
import 'package:groceryshop/Repo/ListRepo.dart';
import 'package:groceryshop/Screens/AuthScreens/OnboardingScreen.dart';

import '../../Repo/ColorRepo.dart';
import '../../Repo/ImageRepo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _logoJumped = false;
  final String _appVersion = "2.0.1";

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _logoJumped = true;
      });
    });

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorRepo.primary2,
      body: Stack(
        children: [
          Image.asset(ImageRepo.splashBg, height: screenHeight, width: screenWidth),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            top: _logoJumped ? MediaQuery.of(context).size.height / 3 : MediaQuery.of(context).size.height,
            left: MediaQuery.of(context).size.width / 2 - 50, // Assuming the logo width is 100
            child: Column(
              children: <Widget>[
                Image.asset(ImageRepo.logoHeadWhite, height: 100),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Version ${ListRepo.companyInfo[0]['AppVersion']}",
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 11,
                      color: ColorRepo.background,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "© 2024 ${ListRepo.companyInfo[0]['AppName'].toString().toLowerCase()}",
                    style: const  TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 8,
                      color: ColorRepo.background,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
