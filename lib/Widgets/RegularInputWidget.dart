import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../Repo/ColorRepo.dart';

class RegularInputWidget extends StatefulWidget {
  final double screenWidth;
  final String hintText;
  final TextEditingController controller;
  final Icon prefixIcon;
  final bool isValid;

  const RegularInputWidget({
    super.key,
    required this.screenWidth,
    required this.hintText,
    required this.controller,
    required this.prefixIcon,
    required this.isValid,
  });

  @override
  _RegularInputWidgetState createState() => _RegularInputWidgetState();
}

class _RegularInputWidgetState extends State<RegularInputWidget> {
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
          widget.prefixIcon,
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF919191),
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                ),
              ),
              keyboardType: TextInputType.text,
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
