import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Repo/ImageRepo.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'package:groceryshop/Widgets/BottomSheets/OrderSuccessBottomSheetWidget.dart';
import 'dart:ui';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/CustomDivider.dart';
import '../../Widgets/CustomImageButton.dart';
import '../../Widgets/StarCoinWiget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  double currentBalance = 200;
  double checkoutAmount = 500;

  void _processPayment(){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const OrderSuccessBottomSheetWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      appBar: AppBar(
        backgroundColor: ColorRepo.background,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 20.0),
          child: GestureDetector(
            onTap: () {
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
        ),
        title: Text(
          ScreenContext.pageTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorRepo.dark,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.only(
              top: RadiiRepo.appBarUnderPaddingLite,
              left: RadiiRepo.screenPadding,
              right: RadiiRepo.screenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ScreenContext.labelText[0],
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: ColorRepo.dark,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                CustomImageButton(
                  buttonText: ScreenContext.btnText[0],
                  imagePath: ImageRepo.paystack,
                  borderColor: ColorRepo.danger,
                  bgColor: ColorRepo.transparent,
                  textColor: ColorRepo.dark,
                  width: screenWidth,
                  onPressed: _processPayment,
                ),
                const SizedBox(height: 10),
                CustomImageButton(
                  buttonText: ScreenContext.btnText[1],
                  imagePath: ImageRepo.payfi,
                  borderColor: ColorRepo.danger,
                  bgColor: ColorRepo.transparent,
                  textColor: ColorRepo.dark,
                  width: screenWidth,
                  onPressed: _processPayment,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 1, width: screenWidth * 0.38, child: const CustomDivider()),
                    Text(
                      ScreenContext.bodyText[0],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: ColorRepo.dark,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(height: 1, width: screenWidth * 0.38, child: const CustomDivider()),
                  ],),
                const SizedBox(height: 20),
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: ColorRepo.foreground,
                    borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                    border: Border.all(
                      color: ColorRepo.muted2,
                      width: 1.0,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(PhosphorIcons.coins, color: ColorRepo.primary2),
                              const SizedBox(width: 10),
                              Text(
                                ScreenContext.labelText[1],
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: ColorRepo.dark,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                ScreenContext.labelText[2],
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: ColorRepo.dark,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const StarCoinWidget(
                                padding: 4.0,
                                color: ColorRepo.warning,
                                borderRadius: 100.0,
                                icon: PhosphorIcons.star_fill,
                                iconSize: 14.0,
                                iconColor: ColorRepo.background,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                StringFormatHelper.formatBalanceLite(currentBalance, showCurrency: false),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: ColorRepo.success,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 21,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          currentBalance >= checkoutAmount ? const SizedBox() : SizedBox(
                            width: screenWidth * 0.6,
                            child: Text(
                              ScreenContext.errorMessage[0],
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: ColorRepo.danger,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        PhosphorIcons.caret_right,
                        size: 24,
                        color: ColorRepo.dark,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

class ScreenContext {
  static String pageTitle = 'Payment Method';
  static String exitText = 'Cancel';

  static const List<String> labelText = [
    'Select a payment method',
    'Shopping Points',
    'Current Balance:',
  ];

  static const List<String> bodyText = [
    'Or',
  ];

  static const List<String> bottomSheetText = [
    'Order placed successfully',
    'Sit back and relax as we get your foodstuffs, is on it’s way!',
  ];

  static const List<String> errorMessage = [
    'Not enough shopping points, Can’t use points.',
  ];

  static const List<String> btnText = [
    'Pay with PayStack',
    'Pay with PayFi',
    'Track order',
    'Done',
  ];
}
