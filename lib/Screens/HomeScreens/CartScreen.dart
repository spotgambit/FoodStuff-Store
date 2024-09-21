import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/CheckoutScreens/OrderSummaryScreen.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'package:groceryshop/Widgets/CartShimmerWidget.dart';
import 'package:groceryshop/Widgets/EmptyListWidget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/CartListWidget.dart';
import '../../Widgets/CustomDivider.dart';
import '../../Widgets/DeliveryInfoWidget.dart';
import '../../Widgets/NoInternetWidget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();
  bool _isPageLoading = true;
  String username = "Boma";
  String address = "Kado Estate, FCT, Abuja";
  double subTotal = 8060.00;
  bool _isConnected = true;
  late Timer _timer;

  List<TextEditingController> _quantityControllers = [];

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
    for (int i = 0; i < ListRepo.products.length; i++) {
      _quantityControllers.add(TextEditingController());
      _quantityControllers[i].text = '1';
    }
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

  void _checkout() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const OrderSummaryScreen()),
    );
  }

  Future<void> _refreshPage() async {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });

    setState(() {
      _isPageLoading = true;
      _isConnected = true;
    });
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isPageLoading = false;
        _checkInternetConnection();
      });
    });

    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState!.show();
            },
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    // Dispose of all controllers when the widget is disposed
    for (TextEditingController controller in _quantityControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorRepo.background,
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _refreshPage,
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.only(
                top: RadiiRepo.whenNoAppBarUnderPadding,
                left: RadiiRepo.screenPadding,
                right: RadiiRepo.screenPadding,
                bottom: 100, // Ensures space for the button
              ),
              child: Column(
                children: [
                  DeliveryInfo(
                    username: username,
                    address: address,
                    width: screenWidth,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ScreenContext.bodyText[0],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            StringFormatHelper.formatBalance(subTotal),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: ColorRepo.dark,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                        width: screenWidth * 0.4,
                        child: ElevatedButton(
                          onPressed: _checkout,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorRepo.primary2,
                            padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                            ),
                          ),
                          child: Text(
                            ScreenContext.btnText[0],
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
                  const SizedBox(height: 20),
                  const CustomDivider(),
                  const SizedBox(height: 20),
                  _isPageLoading
                      ? const CartShimmerWidget()
                      : !_isConnected
                      ? NoInternetWidget(onRetry: _retryConnection)
                      : ListRepo.products.isEmpty
                      ? EmptyListWidget(
                        hintText: ScreenContext.bodyText[1],
                      icon: const Icon(
                        PhosphorIcons.trash,
                        color: ColorRepo.background,
                        ),
                      bodyText: ScreenContext.bodyText[2],
                      linkAction: (){

                      },
                      linkText: ScreenContext.linkText[0])
                      : SizedBox(
                    height: screenHeight * 0.77,
                    child: CartListWidget(
                      products: ListRepo.products,
                      controllers: _quantityControllers,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static const List<String> btnText = [
    'Checkout',

  ];

  static const List<String> linkText = [
    'Get shopping',
  ];

  static const List<String> bodyText = [
    'Subtotal:',
    'You can swipe left to delete item from cart.',
    'Your shopping cart is empty',
  ];
}
