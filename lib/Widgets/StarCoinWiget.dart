import 'package:flutter/material.dart';

class StarCoinWidget extends StatelessWidget {
  final double padding;
  final Color color;
  final double borderRadius;
  final IconData icon;
  final double iconSize;
  final Color iconColor;

  const StarCoinWidget({
    Key? key,
    required this.padding,
    required this.color,
    required this.borderRadius,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Icon(icon, size: iconSize, color: iconColor),
    );
  }
}
