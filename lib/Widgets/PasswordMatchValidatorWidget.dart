import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../Repo/ColorRepo.dart';

class PasswordMatchValidatorWidget extends StatefulWidget {
  final bool isMatch;

  const PasswordMatchValidatorWidget({
    super.key,
    required this.isMatch,
  });

  @override
  _PasswordMatchValidatorWidgetState createState() => _PasswordMatchValidatorWidgetState();
}

class _PasswordMatchValidatorWidgetState extends State<PasswordMatchValidatorWidget> {
  @override
  Widget build(BuildContext context) {
    Color getColor(bool condition) {
      return condition ? ColorRepo.success : ColorRepo.muted;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(PhosphorIcons.check, color: getColor(widget.isMatch), size: 16),
          const SizedBox(width: 10),
          Text(
            'Both passwords must match',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 14,
              color: getColor(widget.isMatch),
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
