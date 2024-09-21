import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String username;
  final String imageUrl;
  final double height;
  final double width;

  CircleAvatarWidget({required this.imageUrl, required this.username, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 4),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.blue,
        backgroundImage: NetworkImage(imageUrl),
        child: imageUrl.isEmpty
            ? Text(
          username[0].toUpperCase(),
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        )
            : null,
      ),
    );
  }
}