import 'package:flutter/material.dart';

class CustomSnackBar {
  static SnackBar create({
    required Icon icon,
    required String mainText,
    required String subText,
    required double screenHeight,
    required Function action,
  }) {
    return SnackBar(
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      behavior: SnackBarBehavior.floating, // Makes it float
      margin: EdgeInsets.only(
        bottom: screenHeight * 0.14, // Adjust vertical position
        left: 16,
        right: 16,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            mainText,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 224, 227),
              fontFamily: 'Urbanist',
              fontSize: 16
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: (){
              action();
            },
            child: Text(
              subText,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 224, 227),
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                fontSize: 16
              ),
            ),
          ),
        ],
      ),
    );
  }
}