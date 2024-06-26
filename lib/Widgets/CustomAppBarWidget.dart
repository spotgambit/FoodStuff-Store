import 'package:flutter/material.dart';

import '../Repo/ColorRepo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onCancel;
  final bool showTitle;

  const CustomAppBar({Key? key, required this.title, required this.onCancel, required this.showTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Remove the default back button
      backgroundColor: ColorRepo.background,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onCancel,
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: ColorRepo.dark,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.normal,
                fontSize: 16
              ),
            ),
          ),
          showTitle ? Text(
            title,
            style: const TextStyle(
              color: ColorRepo.dark,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
            ),
          ) : const SizedBox(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
