import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../Repo/ColorRepo.dart';

class UserAvatarSmallWidget extends StatelessWidget {
  final String imageUrl;
  final String fullName;

  UserAvatarSmallWidget({required this.imageUrl, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ColorRepo.orange, width: 1.0),
        color: ColorRepo.orangeLite2,
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
        style: const TextStyle(
          fontSize: 21.0,
          fontFamily: 'MadeGentle',
          fontWeight: FontWeight.bold,
          color: ColorRepo.orangeLite,
        ),
      ),
    );
  }
}
