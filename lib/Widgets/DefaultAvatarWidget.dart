import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';

class DefaultAvatarWidget extends StatefulWidget {
  final double avaterSize;
  final double height;
  final double width;

  const DefaultAvatarWidget({
    Key? key,
    required this.avaterSize,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _DefaultAvatarWidgetState createState() => _DefaultAvatarWidgetState();
}

class _DefaultAvatarWidgetState extends State<DefaultAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorRepo.mutedLite
      ),
      child: Center(
        child: Icon(
            PhosphorIcons.user,
            color: ColorRepo.muted,
            size: widget.avaterSize),
      ),
    );
  }
}
