import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../Repo/ColorRepo.dart';
import 'StarCoinWiget.dart';

class IconPillWidget extends StatelessWidget {
  final Color borderColor;
  final Color bgColor;
  final String text;

  const IconPillWidget({
    Key? key,
    this.borderColor = ColorRepo.warningLite,
    this.bgColor = ColorRepo.warningLite2,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: Row(children: [
        const StarCoinWidget(
          padding: 2.0,
          color: ColorRepo.warning,
          borderRadius: 100.0,
          icon: PhosphorIcons.star_fill,
          iconSize: 10.0,
          iconColor: ColorRepo.background,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: ColorRepo.brown,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
      ),
    );
  }
}
