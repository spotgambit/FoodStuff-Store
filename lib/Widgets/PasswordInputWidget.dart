import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class PasswordInputWidget extends StatefulWidget {
  final double screenWidth;
  final String hintText;
  final TextEditingController controller;

  const PasswordInputWidget({
    Key? key,
    required this.screenWidth,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordInputWidgetState createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: widget.screenWidth,
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
          const Icon(
            PhosphorIcons.lock_open,
            size: 24,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    _obscureText ? PhosphorIcons.eye_slash : PhosphorIcons.eye,
                    size: 24,
                  ),
                  onPressed: _toggleVisibility,
                ),
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
