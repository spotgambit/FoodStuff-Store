import 'package:flutter/material.dart';
import '../Repo/Enums/Shapes.dart';

class RadioButtonWidget extends StatefulWidget {
  final bool selected;
  final Color baseColor;
  final Color unSelectedBgColor;
  final Color selectedBgColor;
  final Color selectedBorderColor;
  final Color unSelectedBorderColor;
  final Function onTap;
  final Shapes shape;

  const RadioButtonWidget({
    Key? key,
    required this.selected,
    required this.baseColor,
    required this.unSelectedBgColor,
    required this.selectedBgColor,
    required this.selectedBorderColor,
    required this.unSelectedBorderColor,
    required this.onTap,
    required this.shape,
  }) : super(key: key);

  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        height: 30,
        width: 30,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: widget.baseColor,
          border: Border.all(
            color: widget.selected ? widget.selectedBorderColor : widget.unSelectedBorderColor,
            width: 2.0,
          ),
          borderRadius: widget.shape == Shapes.circle ? BorderRadius.circular(15) : BorderRadius.circular(5),
        ),
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: widget.selected ? widget.selectedBgColor : widget.unSelectedBgColor,
            borderRadius: widget.shape == Shapes.circle ? BorderRadius.circular(15) : BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
