import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';

class RoundGradientIcon extends StatefulWidget {
  final Icon icon;
  final double height;
  final double width;

  const RoundGradientIcon({
    Key? key,
    required this.icon,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _RoundGradientIconState createState() => _RoundGradientIconState();
}

class _RoundGradientIconState extends State<RoundGradientIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [ColorRepo.primary2, ColorRepo.background],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: widget.icon,
      ),
    );
  }
}
