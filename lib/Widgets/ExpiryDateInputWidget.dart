import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../Repo/ColorRepo.dart';

class ExpiryDateInputWidget extends StatefulWidget {
  final double screenWidth;
  final String hintText;
  final TextEditingController controller;
  final bool isValid;

  const ExpiryDateInputWidget({
    Key? key,
    required this.screenWidth,
    required this.hintText,
    required this.controller,
    required this.isValid,
  }) : super(key: key);

  @override
  _ExpiryDateInputWidgetState createState() => _ExpiryDateInputWidgetState();
}

class _ExpiryDateInputWidgetState extends State<ExpiryDateInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: widget.screenWidth,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.80, color: widget.isValid ? ColorRepo.muted : ColorRepo.secondary),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            PhosphorIcons.calendar_blank,
            size: 24,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: widget.controller,
              maxLength: 5,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                counterText: "",
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
