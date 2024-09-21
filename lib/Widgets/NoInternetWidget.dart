import 'package:flutter/material.dart';
import 'package:groceryshop/Repo/ImageRepo.dart';

import '../Repo/ColorRepo.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetWidget({Key? key, required this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageRepo.brokenEgg, height: 150), // Add your image asset
            const SizedBox(height: 20),
            const Text(
              'Oops!',
              style: TextStyle(
                fontFamily: 'MadeGentle',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            const Text(
              'No internet connection',
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 18,
                color: ColorRepo.dark,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            const Text(
              'Please check your internet connection',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 16,
                color: ColorRepo.dark,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onRetry,
              child: const Text(
                'Try again',
                style: TextStyle(
                  color: ColorRepo.link,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline, // Underline the text
                  decorationColor: ColorRepo.link, // Set underline color to match text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
