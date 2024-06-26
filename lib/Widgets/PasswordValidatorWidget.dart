import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class PasswordValidatorWidget extends StatefulWidget {
  final bool isMinimumCharacters;
  final bool hasUppercase;
  final bool hasSpecialCharacter;
  final bool isPasswordFieldEmpty;

  const PasswordValidatorWidget({
    super.key,
    required this.isMinimumCharacters,
    required this.hasUppercase,
    required this.hasSpecialCharacter,
    required this.isPasswordFieldEmpty,
  });

  @override
  _PasswordValidatorWidgetState createState() => _PasswordValidatorWidgetState();
}

class _PasswordValidatorWidgetState extends State<PasswordValidatorWidget> {
  @override
  Widget build(BuildContext context) {
    Color getColor(bool condition) {
      if (widget.isPasswordFieldEmpty) {
        return Colors.grey[400]!;
      }
      return condition ? Colors.green : Colors.red;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Wrap(
        spacing: 20.0, // spacing between items
        runSpacing: 10.0, // spacing between rows
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(PhosphorIcons.check, color: getColor(widget.isMinimumCharacters), size: 16),
              const SizedBox(width: 10),
              Text(
                'Minimum 8 characters',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14,
                  color: getColor(widget.isMinimumCharacters),
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(PhosphorIcons.check, color: getColor(widget.hasUppercase), size: 16),
              const SizedBox(width: 10),
              Text(
                'Uppercase',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14,
                  color: getColor(widget.hasUppercase),
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(PhosphorIcons.check, color: getColor(widget.hasSpecialCharacter), size: 16),
              const SizedBox(width: 10),
              Text(
                'At least one special character',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14,
                  color: getColor(widget.hasSpecialCharacter),
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
