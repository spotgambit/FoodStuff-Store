import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/CheckoutScreens/PaymentScreen.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'package:groceryshop/Widgets/BottomSheets/FilterCustomerReviewsBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/OrderSummaryListWidget.dart';
import 'package:groceryshop/Widgets/OrderSummaryShimmerWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/CustomDivider.dart';
import '../../Widgets/DeliveryInfo2Widget.dart';
import '../../Widgets/NoInternetWidget.dart';
import '../../Widgets/RateProductWidget3.dart';
import '../../Widgets/ReviewListWidget.dart';
import '../../Widgets/SingleProductWidget.dart';
import '../../Widgets/BottomSheets/WriteReviewScreen.dart';

class ReviewsScreen extends StatefulWidget {
  final String image;
  final String name;
  final double discount;

  const ReviewsScreen({super.key, required this. image, required this.name, required this.discount});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
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
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          ScreenContext.appBarText[0],
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorRepo.dark,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => WriteReviewBottomSheet(image: widget.image, name: widget.name, discount: widget.discount),
              );
            },
            child: Row(
              children: [
                const Padding(
                  padding:  EdgeInsets.only(right: 8.0),
                  child: Icon(PhosphorIcons.pencil_line, color: ColorRepo.primary2, size: 16,),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: RadiiRepo.itemPaddingRight),
                  child: Text(
                    ScreenContext.appBarText[1],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(child:
        Padding(padding: const EdgeInsets.only(
          top: RadiiRepo.appBarUnderPaddingLite,
          left: RadiiRepo.screenPadding,
          right: RadiiRepo.screenPadding,
          bottom: 100, // Ensures space for the button
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleProductWidget(image: widget.image, name: widget.name, discount: widget.discount),
              const SizedBox(height: 40),
              const RateProductWidget3(),
              const SizedBox(height: 20),
              const CustomDivider(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ScreenContext.headerText[0],
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      color: ColorRepo.dark,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => const FilterCustomerReviewsBottomSheetWidget(),
                        );
                      },
                      child: const Icon(PhosphorIcons.funnel_simple, color: ColorRepo.dark)),
                ],
              ),
              const SizedBox(height: 20),
              const ReviewListWidget(reviews: ListRepo.reviews),
            ],),
        ),),
      ),
    );
  }
}

class ScreenContext {
  static const List<String> appBarText = ['Reviews', 'Write a review'];

  static const List<String> headerText = ['Customer’s Review & Ratings'];
}
