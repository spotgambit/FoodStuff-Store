import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';
import 'dart:ui';

class LikeButton extends StatefulWidget {
  final bool isLiked;
  final double size;
  final ValueChanged<bool> onLikeChanged;

  const LikeButton({
    Key? key,
    required this.isLiked,
    required this.size,
    required this.onLikeChanged,
  }) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with SingleTickerProviderStateMixin {
  late bool isLiked;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    if (isLiked) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      widget.onLikeChanged(isLiked);
      if (isLiked) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLike,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: ColorRepo.muted, // Border color
                width: 0.5
              ),
            ),
            child: Icon(
              isLiked ? PhosphorIcons.heart_fill : PhosphorIcons.heart,
              color: isLiked ? const Color.fromRGBO(234, 31, 42, 1) : ColorRepo.dark,
              size: widget.size,
            ),
          ),
        ),
      ),
    );
  }
}
