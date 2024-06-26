import 'package:flutter/material.dart';
import 'package:groceryshop/Repo/ColorRepo.dart';

class PhoneNumberInputWidget extends StatelessWidget {
  final double screenWidth;
  final String hintText;
  final TextEditingController controller;

  const PhoneNumberInputWidget({
    super.key,
    required this.screenWidth,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: screenWidth,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.80, color: Color(0xFF919191)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '+234',
            style: TextStyle(
              color: Color(0xFF303030),
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w400,
              height: 0.09,
            ),
          ),
          const SizedBox(width: 8),
          Container(height: 50, width: 1, color: ColorRepo.dark) ,
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              maxLength: 11,
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF919191),
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                ),
              ),
              keyboardType: TextInputType.phone,
              style: const TextStyle(
                color: Color(0xFF303030),
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
