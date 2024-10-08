import 'package:flutter/material.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ImageRepo.dart';
import '../../Repo/RadiiRepo.dart';
import 'SignIn.dart';
import 'SignUp.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentSlide = 0;
  final PageController _pageController = PageController();

  void _skipOnboarding() {
    if (_currentSlide == ScreenContext.headers.length - 1) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    } else {
      _pageController.animateToPage(
        ScreenContext.headers.length - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentSlide = ScreenContext.headers.length - 1;
      });
    }
  }

  void _nextSlide() {
    if (_currentSlide < ScreenContext.headers.length - 1) {
      setState(() {
        _currentSlide++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: ColorRepo.onboardingScreenBgColors[_currentSlide],
            height: screenHeight,
            width: screenWidth,
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.2),
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentSlide = index;
                  });
                },
                children: [
                  Image.asset(ImageRepo.onboardingScreenImages[0]),
                  Image.asset(ImageRepo.onboardingScreenImages[1]),
                  Image.asset(ImageRepo.onboardingScreenImages[2]),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(ImageRepo.ellipseSquare, width: screenWidth),
          ),
          Positioned(
            bottom: 140,
            left: 0,
            right: 0,
            child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.2, left: RadiiRepo.screenPadding, right: RadiiRepo.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth,
                  child: Text(
                    ScreenContext.headers[_currentSlide],
                    style: TextStyle(
                      fontFamily: 'MadeGentle',
                      fontSize: screenWidth * 0.060,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  ScreenContext.descriptions[_currentSlide],
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: screenWidth * 0.045,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(RadiiRepo.screenPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: screenWidth * 0.44,
                    child: OutlinedButton(
                      onPressed: _skipOnboarding,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: _currentSlide == ScreenContext.headers.length - 1 ? ColorRepo.primary2 : ColorRepo.transparent),
                        padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                        ),
                      ),
                      child: Text(
                        _currentSlide == ScreenContext.headers.length - 1 ? ScreenContext.login : ScreenContext.skip,
                        style: const TextStyle(color: ColorRepo.dark, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.44,
                    child: ElevatedButton(
                      onPressed: _nextSlide,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorRepo.primary2,
                        padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                        ),
                      ),
                      child: Text(
                        ScreenContext.buttons[_currentSlide],
                        style: const TextStyle(color: Colors.white, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
                      ),
                    ),
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

class ScreenContext {
  static const List<String> headers = [
    'Modern perishable packaging',
    'Rich, affordable products',
    'Swift delivery service',
  ];

  static const List<String> descriptions = [
    'Experience the latest in food packaging technology, ensuring your perishables stay fresh and secure.',
    'Discover a wide variety of high-quality products that are both rich in nutrients and light on your wallet.',
    'Enjoy lightning-fast delivery service that brings your orders right to your doorstep in no time.',
  ];

  static const List<String> buttons = [
    'Next',
    'Next',
    'Create account',
  ];

  static const String skip = 'Skip';
  static const String login = 'Login';
}
