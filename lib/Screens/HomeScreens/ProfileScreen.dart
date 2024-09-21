import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/NotificationScreens/NotificationScreen.dart';
import 'package:groceryshop/Screens/NotificationScreens/OrderScreen.dart';
import 'package:groceryshop/Screens/SettingsScreens/SettingsScreen.dart';
import 'package:groceryshop/Widgets/CustomDivider.dart';

import '../../Repo/ColorRepo.dart';
import '../../Repo/ImageRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Utils/StringFormatterHelper.dart';
import '../../Widgets/OrderListWidget.dart';
import '../../Widgets/ShoppingListHorizontalWidget.dart';
import '../../Widgets/StarCoinWiget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = "Boma";
  String userId = "314565zD";
  double currentBalance = 50000;
  double coinBalance = 500;

  void _navigateTo(int screenIndex){
    switch(screenIndex){
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const NotificationScreen()),
        );
        break;

      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
        );
        break;

      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const OrderScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Padding(
          padding: const EdgeInsets.only(
            top: RadiiRepo.whenNoAppBarUnderPadding,
            left: RadiiRepo.screenPadding,
            right: RadiiRepo.screenPadding,
            bottom: 100, // Ensures space for the button
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, $username",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: ColorRepo.dark,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(children: [
                        const Icon(
                          PhosphorIcons.scan_light,
                          color: ColorRepo.primary2,
                          size: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          userId,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          PhosphorIcons.question_fill,
                          color: ColorRepo.muted,
                          size: 14,
                        ),
                      ],)
                    ],
                  ),
                  Row(children: [
                    GestureDetector(
                      onTap: (){
                        _navigateTo(0);
                      },
                      child: const Icon(
                        PhosphorIcons.bell,
                        color: ColorRepo.dark,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: (){
                        _navigateTo(1);
                      },
                      child: const Icon(
                        PhosphorIcons.gear,
                        color: ColorRepo.dark,
                      ),
                    ),
                  ],)
                ],),
              const SizedBox(height:20),
              Container(
                width: screenWidth,
                height: 111,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorRepo.successDark,
                  image: const DecorationImage(
                    image: AssetImage(ImageRepo.splashBgWhite), // Update this path to your image path
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              PhosphorIcons.question_fill,
                              color: ColorRepo.background,
                              size: 16,
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              ScreenContext.labelText[0],
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: ColorRepo.background,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(children: [
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
                              StringFormatHelper.formatBalanceLite(coinBalance, showCurrency: false, decimalPlaces: 0),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: ColorRepo.success,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                              ),
                            ),
                          ],),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            ScreenContext.labelText[1],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: ColorRepo.background,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            StringFormatHelper.formatBalanceLite(currentBalance, showCurrency: false, decimalPlaces: 2),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: ColorRepo.success,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height:40),
              Text(
                ScreenContext.headerText[0],
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: ColorRepo.muted,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ScreenContext.headerText[1],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _navigateTo(2);
                    },
                    child: Text(
                      ScreenContext.linkText[0],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: ColorRepo.link,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:10),
              Text(
                ScreenContext.bodyText[0],
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: ColorRepo.muted,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: ListRepo.orders.isNotEmpty ? 0 : 20),
              ListRepo.orders.isNotEmpty ? const OrderListWidget(orders: ListRepo.orders, status: 'pending',  singleItem: true) : SizedBox(height: 100, width: screenWidth, child:
                Center(child: Text(
                  ScreenContext.linkText[1],
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: ColorRepo.primary2,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),),),
              const SizedBox(height:20),
              const CustomDivider(),
              const SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ScreenContext.headerText[2],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Text(
                      ScreenContext.linkText[0],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: ColorRepo.link,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const ShoppingListHorizontalWidget(
                  listItems: ListRepo.shoppingLists
              ),
              const SizedBox(height: 40,),
              Container(
                height: 150,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Image.asset(ImageRepo.gift, height: 32, width: 32),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ScreenContext.headerText[3],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth - 110,
                            child: Text(
                              ScreenContext.bodyText[1],
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: ColorRepo.muted,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],),
                    const SizedBox(height:20),
                    const CustomDivider(),
                    const SizedBox(height:20),
                  ],
                ),
              ),
            ],),
        ),
      ),
    );
  }
}

class ScreenContext {
  static List<String> labelText = ['Shopping Points Balance:', 'Equals: '];
  static List<String> headerText = ['Activity', 'Your orders', 'Your shopping list', 'Referral Reward'];
  static List<String> bodyText = ['Oops, no current shopping order', 'Refer someone today and get more shopping points, using your referral link today.'];
  static List<String> linkText = ['View all', 'Get Shopping'];
}
