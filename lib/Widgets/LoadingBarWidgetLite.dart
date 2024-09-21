import 'package:flutter/material.dart';

import '../Repo/ColorRepo.dart';
import '../Repo/RadiiRepo.dart';

class LoadingBarWidgetLite extends StatelessWidget {
  final double progress;

  const LoadingBarWidgetLite({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                height: 2,
                width: ((progress/100) * screenWidth) - (RadiiRepo.screenPadding * 4),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorRepo.successLite,
                      ColorRepo.success,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ((progress/100) * screenWidth) - (RadiiRepo.screenPadding * 4)),
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: ColorRepo.success,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
