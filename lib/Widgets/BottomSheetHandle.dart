import 'package:flutter/material.dart';

import '../Repo/ColorRepo.dart';

class BottomSheetHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      child: Center(
        child: Container(
          height: 5,
          width: 32,
          decoration: BoxDecoration(
            color: ColorRepo.muted2,
            borderRadius: BorderRadius.circular(20), // Makes it pill-shaped
          ),
        ),
      ),
    );
  }
}
