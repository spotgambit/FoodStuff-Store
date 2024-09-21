import 'package:flutter/material.dart';
import 'package:groceryshop/Repo/RadiiRepo.dart';

import '../Repo/ColorRepo.dart';

class CustomImageButton extends StatelessWidget {
  final String buttonText;
  final String imagePath;
  final Color borderColor;
  final Color bgColor;
  final Color textColor;
  final double width;
  final VoidCallback onPressed;

  const CustomImageButton({
    required this.buttonText,
    required this.imagePath,
    required this.borderColor,
    required this.bgColor,
    required this.textColor,
    required this.width,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: 16.0,
              height: 16.0,
            ),
            const SizedBox(width: 8.0),
            Text(
              buttonText,
              style: const TextStyle(
                color: ColorRepo.dark,
                fontFamily: 'Urbanist',
                fontSize: 16.0,
                fontWeight: FontWeight.w700
              ),
            ),
          ],
        ),
      ),
    );
  }
}
