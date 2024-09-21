import 'package:flutter/material.dart';

import '../Repo/ColorRepo.dart';

class CustomDividerVertical extends StatelessWidget {
  final Color color;
  final double thickness;
  final double indent;
  final double endIndent;
  final double height;

  const CustomDividerVertical({
    Key? key,
    this.color = ColorRepo.muted2,
    this.thickness = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: thickness,
      color: color,
      height: height,  // This makes the divider span the entire height
    );
  }
}
