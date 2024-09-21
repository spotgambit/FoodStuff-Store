import 'package:flutter/material.dart';

import '../Repo/ColorRepo.dart';

class DotWidget extends StatelessWidget {
  final double size;
  final Color color;

  const DotWidget({
    Key? key,
    this.size = 6,   // The diameter of the dot
    this.color = ColorRepo.muted,  // The color of the dot
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
