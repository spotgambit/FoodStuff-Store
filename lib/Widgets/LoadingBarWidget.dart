import 'package:flutter/material.dart';

class LoadingBarWidget extends StatefulWidget {
  final double width;
  final double percentage;
  final Color foregroundColor;
  final Color backgroundColor;

  const LoadingBarWidget({
    Key? key,
    required this.width,
    required this.percentage,
    required this.foregroundColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  _LoadingBarWidgetState createState() => _LoadingBarWidgetState();
}

class _LoadingBarWidgetState extends State<LoadingBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 10,
          width: widget.width,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 10,
          width: (widget.percentage/100)*widget.width,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: widget.foregroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}