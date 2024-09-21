import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryshop/Repo/RadiiRepo.dart';
import '../Repo/ColorRepo.dart';

class SquareGradientIcon extends StatefulWidget {
  final Icon icon;
  final double height;
  final double width;

  const SquareGradientIcon({
    Key? key,
    required this.icon,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _SquareGradientIconState createState() => _SquareGradientIconState();
}

class _SquareGradientIconState extends State<SquareGradientIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
        gradient: const LinearGradient(
          colors: [ColorRepo.background, ColorRepo.orangeLite, ColorRepo.orange],
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
