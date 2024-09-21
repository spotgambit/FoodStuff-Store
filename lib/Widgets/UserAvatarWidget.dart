import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../Repo/ColorRepo.dart';

class UserAvatarWidget extends StatelessWidget {
  final String imageUrl;
  final String fullName;

  UserAvatarWidget({required this.imageUrl, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ColorRepo.orange, width: 1.0),
        color: ColorRepo.orangeLite,
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => _buildInitials(),
          errorWidget: (context, url, error) => _buildInitials(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildInitials() {
    return Center(
      child: Text(
        fullName.isNotEmpty ? fullName[0].toUpperCase() : '',
        style: TextStyle(
          fontSize: 30.0,
          fontFamily: 'MadeGentle',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
