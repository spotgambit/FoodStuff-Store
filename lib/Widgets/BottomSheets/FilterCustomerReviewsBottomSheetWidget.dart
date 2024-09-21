import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:groceryshop/Widgets/CustomDivider.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';
import 'MembershipAgreementBottomSheetWidget.dart';

class FilterCustomerReviewsBottomSheetWidget extends StatefulWidget {
  final String previousScreen;
  const FilterCustomerReviewsBottomSheetWidget({super.key, this.previousScreen = ""});

  @override
  State<FilterCustomerReviewsBottomSheetWidget> createState() => _FilterCustomerReviewsBottomSheetWidgetState();
}

class _FilterCustomerReviewsBottomSheetWidgetState extends State<FilterCustomerReviewsBottomSheetWidget> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: SizedBox(
          height: 300,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: const Text(
                          ScreenContext.exitText,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Text(
                        ScreenContext.appBarText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
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
                  Text(
                    ScreenContext.optionText[0],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const CustomDivider(),
                  const SizedBox(height: 20,),
                  Text(
                    ScreenContext.optionText[1],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static const String exitText = "Cancel";
  static const String appBarText = "Filter by";
  static const List<String> optionText = ["Most recent review & rating", "Top reviews & rating"];
}
