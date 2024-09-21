import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Repo/ImageRepo.dart';
import 'package:groceryshop/Widgets/BottomSheets/BillingHistoryBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/CustomDivider.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/BottomNavigationWidgetScreen.dart';
import '../../Widgets/BottomSheets/AddPaymentMethodBottomSheetWidget.dart';
import '../../Widgets/BottomSheets/CancelMembershipBottomSheetWidget.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  double _premiumPrice = 999.00;
  String _cardNumber = "*****4567";

  _addPaymentMethod(){
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const AddPaymentMethodBottomSheetWidget(previousScreen: ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      appBar: AppBar(
        backgroundColor: ColorRepo.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(PhosphorIcons.arrow_left, color: ColorRepo.dark),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const BottomNavigationWidgetScreen(selectedIndex: 3)),
            );
          },
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
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.only(
              left: RadiiRepo.screenPadding,
              right: RadiiRepo.screenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                Image.asset(ImageRepo.crownSimple),
                const SizedBox(height: 5,),
                Text(
                  ScreenContext.headerText[0],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorRepo.dark,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  "Auto-renews on 15/08/24 for ₦ $_premiumPrice / month",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorRepo.muted,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20,),
                const CustomDivider(),
                const SizedBox(height: 20,),
                Text(
                  ScreenContext.headerText[1],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorRepo.muted,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    _addPaymentMethod();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorRepo.foreground,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: ColorRepo.muted2,
                        width: 0.5,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(ImageRepo.visa),
                            const SizedBox(width: 10),
                            Text(
                              "ending with $_cardNumber",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: ColorRepo.dark,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              ScreenContext.linkText[1],
                              style: const TextStyle(color: ColorRepo.muted, fontFamily: 'Urbanist', fontSize: 12),
                            ),
                            const SizedBox(width: 2,),
                            const Icon(
                              PhosphorIcons.caret_right,
                              color: ColorRepo.dark,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          _addPaymentMethod();
                        },
                      child: const Icon(
                        PhosphorIcons.plus_circle,
                        color: ColorRepo.link,
                      ),
                    ),
                    const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          _addPaymentMethod();
                        },
                      child: Text(
                        ScreenContext.linkText[0],
                        style: const TextStyle(color: ColorRepo.link, fontFamily: 'Urbanist', fontSize: 14),
                      ),
                    ),
                  ],),
                ),
                const SizedBox(height: 40,),
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => SizedBox( height: screenHeight * 0.7, child: const BillingHistoryBottomSheetWidget()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ScreenContext.headerText[2],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Last billing, 14/03/24 for ₦ $_premiumPrice / month",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorRepo.muted,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        PhosphorIcons.caret_right,
                        color: ColorRepo.dark,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(
                    ScreenContext.headerText[3],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Icon(
                    PhosphorIcons.caret_right,
                    color: ColorRepo.dark,
                  ),
                ],)
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: ColorRepo.background,
        padding: const EdgeInsets.all(RadiiRepo.borderRadius),
        child: OutlinedButton(
          onPressed: (){
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => const CancelMembershipBottomSheetWidget(),
            );
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: ColorRepo.transparent),
            padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
            ),
          ),
          child: Text(
            ScreenContext.buttonText,
            style: const TextStyle(color: ColorRepo.primary2, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static String pageTitle = 'Membership';
  static List<String> headerText = ["FoodstuffStore Premium Member", "Payment method", "Billing History", "See benefits"];
  static String buttonText = 'Cancel membership';
  static List<String> linkText = ['Add new card', 'Active'];
}
