import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:groceryshop/Widgets/BillingHistoryListWidget.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';
import 'MembershipAgreementBottomSheetWidget.dart';

class BillingHistoryBottomSheetWidget extends StatefulWidget {
  final String previousScreen;
  const BillingHistoryBottomSheetWidget({super.key, this.previousScreen = ""});

  @override
  State<BillingHistoryBottomSheetWidget> createState() => _BillingHistoryBottomSheetWidgetState();
}

class _BillingHistoryBottomSheetWidgetState extends State<BillingHistoryBottomSheetWidget> {
  void _goBack() {
    switch (widget.previousScreen) {
      case "MembershipAgreementBottomSheet":
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const MembershipAgreementBottomSheetWidget(),
        );
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomSheetHandle(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _goBack,
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
                const SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 20),
            // Restrict the height of the list so that only it scrolls
            SizedBox(
              height: screenHeight * 0.6, // Adjust this value as needed
              child: const BillingHistoryListWidget(billingHistory: ListRepo.billingHistory),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenContext {
  static const String appBarText = "Billing History";
  static const String exitText = "Cancel";
}
