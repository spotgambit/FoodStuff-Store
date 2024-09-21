import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/FavoriteListWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/NoInternetWidget.dart';
import '../../Widgets/ProductListShimmerWidget.dart';
import '../../Widgets/ProductListWidget.dart';

class FavoriteListScreen extends StatefulWidget {
  final List<Map<String, dynamic>> listItems;
  final String pagetitle;

  const FavoriteListScreen({super.key, required this.listItems, required this.pagetitle});

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  bool _isPageLoading = true;
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
          widget.pagetitle,
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
            },
            child: const Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(right: 8.0),
                  child: Icon(PhosphorIcons.plus_circle, color: ColorRepo.primary2, size: 16,),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: RadiiRepo.itemPaddingRight),
                  child: Text(
                    ScreenContext.appBarText,
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
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: screenHeight + 200,
              width: screenWidth, // Adjust the width to allow horizontal scrolling
              child: Padding(
                padding: const EdgeInsets.only(
                  left: RadiiRepo.screenPadding,
                  right: RadiiRepo.screenPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth,
                      child: Text(
                        '${widget.listItems.length} items',
                        style: const TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 11,
                          color: ColorRepo.muted,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _isPageLoading
                        ? const ProductListShimmerWidget()
                        : !_isConnected
                        ? NoInternetWidget(onRetry: _retryConnection)
                        : SizedBox(
                      height: screenHeight * 0.77,
                      child: const FavoriteListWidget(
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
                height: RadiiRepo.bottomSheetLiteHeight,
                color: ColorRepo.background,
                child: Padding(
                  padding: const EdgeInsets.all(RadiiRepo.screenPadding),
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth - 30,
                        child: OutlinedButton(
                          onPressed: (){},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: ColorRepo.primary2),
                            padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                            ),
                          ),
                          child: const Text(
                            ScreenContext.btnText,
                            style: TextStyle(color: ColorRepo.dark, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
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
  static const String appBarText = 'Add item';
  static const String btnText = 'Place order';
}
