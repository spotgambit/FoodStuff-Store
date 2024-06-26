import 'dart:async';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: ColorRepo.background,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            top: _logoJumped ? MediaQuery.of(context).size.height / 3 : MediaQuery.of(context).size.height,
            left: MediaQuery.of(context).size.width / 2 - 50, // Assuming the logo width is 100
            child: Column(
              children: <Widget>[
                Image.asset(ImageRepo.logoHead),
                const SizedBox(height: 10),
                const Text(
                  'FoodStuff Store',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Urbanist'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

