import 'package:flutter/material.dart';
import 'package:groceryshop/Widgets/CustomTextArea.dart';
import 'package:groceryshop/Widgets/SingleProductWidget.dart';
import 'dart:ui';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../BottomSheetHandle.dart';
import '../RateProductWidget2.dart';
import '../UploadMultipleMediaWidget.dart';

class WriteReviewBottomSheet extends StatefulWidget {
  final String image;
  final String name;
  final double discount;

  const WriteReviewBottomSheet({super.key, required this. image, required this.name, required this.discount});

  @override
  State<WriteReviewBottomSheet> createState() => _WriteReviewBottomSheetState();
}

class _WriteReviewBottomSheetState extends State<WriteReviewBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: 730,
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiiRepo.bottomSheetBorderRadius),
            color: ColorRepo.background,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BottomSheetHandle(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text(
                        ScreenContext.exitText,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: ColorRepo.dark,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      ScreenContext.pageTitle,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: ColorRepo.dark,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SingleProductWidget(image: widget.image, name: widget.name, discount: widget.discount),
                const SizedBox(height: 40),
                const RateProductWidget2(),
                const SizedBox(height: 40),
                CustomTextArea(labelText: ScreenContext.labelText[0], hintText: ScreenContext.hintText[0]),
                const SizedBox(height: 20),
                const UploadMultipleMediaWidget(),
              ],),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                color: ColorRepo.background,
                child: SizedBox(
                  width: screenWidth,
                  child: OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: ColorRepo.primary2),
                      padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                      ),
                    ),
                    child: Text(
                      ScreenContext.btnText[0],
                      style: const TextStyle(color: ColorRepo.dark, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenContext {
  static String pageTitle = 'Write a review';
  static String exitText = 'Cancel';

  static const List<String> btnText = [
    'Submit review',
  ];

  static const List<String> labelText = [
    'Write your review',
  ];

  static const List<String> hintText = [
    '...type in here',
  ];
}
