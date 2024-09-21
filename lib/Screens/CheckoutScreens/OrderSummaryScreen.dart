import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/CheckoutScreens/PaymentScreen.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'package:groceryshop/Widgets/OrderSummaryListWidget.dart';
import 'package:groceryshop/Widgets/OrderSummaryShimmerWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/CustomDivider.dart';
import '../../Widgets/DeliveryInfo2Widget.dart';
import '../../Widgets/NoInternetWidget.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummaryScreen> {
  bool _isPageLoading = true;
  String username = "Boma";
  String address = "Kado Estate, FCT, Abuja";
  double subTotal = 8060.00;
  double itemCost = 8060.00;
  double deliveryFee = 8060.00;
  double totalCost = 8060.00;
  bool _isConnected = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
    // Set _isPageLoading to false after 5 seconds
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _isPageLoading = false;
      });
    });
  }

  void _checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _isConnected = false;
      });
    } else {
      setState(() {
        _isConnected = true;
      });
    }
  }

  void _retryConnection() {
    setState(() {
      _isConnected = true;
      _isPageLoading = true;
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isPageLoading = false;
        _checkInternetConnection();
      });
    });
  }

  void _proceedToPayment(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const PaymentScreen()),
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
            Navigator.of(context).pop();
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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      ScreenContext.headerText[0],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: ColorRepo.orange,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    DeliveryInfo2(
                      address: address,
                      width: screenWidth,
                    ),
                    const SizedBox(height: 20),
                    const CustomDivider(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ScreenContext.orderDetail[0],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          StringFormatHelper.formatBalance(itemCost),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ScreenContext.orderDetail[1],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          StringFormatHelper.formatBalance(itemCost),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ScreenContext.orderDetail[2],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          StringFormatHelper.formatBalance(itemCost),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ScreenContext.orderDetail[3],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                        Text(
                          StringFormatHelper.formatBalance(itemCost),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontWeight: FontWeight.w700,
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const CustomDivider(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ScreenContext.orderDetail[4],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '(${ListRepo.products.length} ${ListRepo.products.length == 1 ? 'item' : 'items'})',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.muted,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _isPageLoading
                        ? const OrderSummaryShimmerWidget()
                        : !_isConnected
                        ? NoInternetWidget(onRetry: _retryConnection)
                        : SizedBox(
                      height: screenHeight * 0.77,
                      child: const OrderSummaryListWidget(
                        products: ListRepo.products
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                height: RadiiRepo.bottomSheetMinHeight,
                color: ColorRepo.background,
                child: Padding(
                  padding: const EdgeInsets.all(RadiiRepo.screenPadding),
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth - 30,
                        child: ElevatedButton(
                          onPressed: _proceedToPayment,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorRepo.primary2,
                            padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                            ),
                          ),
                          child: Text(
                            ScreenContext.btnText,
                            style: const TextStyle(
                              color: ColorRepo.background,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenContext {
  static String pageTitle = 'Order Summary';

  static String btnText = 'Proceed to payment';

  static const List<String> headerText = [
    'Confirm your order',
  ];

  static const List<String> orderDetail = [
    'Items cost:',
    'Delivery & Handling:',
    'Total tax cost:',
    'Order Total:',
    'Order details:',
  ];
}
