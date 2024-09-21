import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Repo/ImageRepo.dart';
import 'package:groceryshop/Screens/HomeScreens/SearchScreen.dart';
import 'package:groceryshop/Widgets/BottomSheets/FundreAiWelcomeBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/NoInternetWidget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'dart:async';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/PillShimmerWidget.dart';
import '../../Widgets/DeliveryInfoWidget.dart';
import '../../Widgets/ProductCarouselWidget.dart';
import '../../Widgets/ProductGridShimmer.dart';
import '../../Widgets/ProductGridWidget.dart';
import '../../Widgets/SearchInputWidget.dart';
import '../../Widgets/TextPillListWidget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  bool _isPageLoading = true;
  String username = "Boma";
  String address = "Kado Estate, FCT, Abuja";
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  double _scrollPosition = 0.0;
  double _mainPageScrollPosition = 0.0;
  bool _isConnected = true;

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
    // Add listener to scroll controller
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
      });
    });
    _scrollController2.addListener(() {
      setState(() {
        _mainPageScrollPosition = _scrollController2.position.pixels;
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

  void _searchFoodStuff(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SearchScreen(keyword: _searchController.text)),
    );
  }

  Future<void> _refreshPage() async{
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });

    setState(() {
      _isPageLoading = true;
      _scrollPosition = 0.0;
      _mainPageScrollPosition = 0.0;
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
    _searchController.dispose();
    _scrollController.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,	// key if you want to add
        onRefresh: _refreshPage,
        child: SingleChildScrollView(
          controller: _scrollController2,
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: screenHeight + 200,
            width: screenWidth, // Adjust the width to allow horizontal scrolling
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: RadiiRepo.whenNoAppBarUnderPadding,
                    left: RadiiRepo.screenPadding,
                    right: RadiiRepo.screenPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (_scrollPosition > 50 || _mainPageScrollPosition > 30)
                          ? const SizedBox.shrink()
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DeliveryInfo(
                            username: username,
                            address: address,
                            width: 0,
                          ),
                          GestureDetector(
                            onTap: (){
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (_) => const FundreAiWelcomeBottomSheetWidget(),
                              );
                            },
                            child: Image.asset(ImageRepo.fundreAiLogo),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SearchInputWidget(
                        screenWidth: screenWidth,
                        hintText: ScreenContext.inputPlaceholders[0],
                        controller: _searchController,
                        isValid: true,
                        onSearch: _searchFoodStuff,
                        onChange: _searchFoodStuff,
                      ),
                      SizedBox(height: _isConnected ? 20 : 0),
                      _isConnected
                          ? Text(
                        ScreenContext.headers[0],
                        style: const TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 16,
                          color: ColorRepo.dark,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      )
                          : const SizedBox(),
                      SizedBox(height: _isConnected ? 20 : 0),
                      _isConnected
                          ? _isPageLoading
                          ? PillShimmerWidget(screenScrollLocation: _mainPageScrollPosition, widgetScrollLocation: _scrollPosition)
                          : TextPillListWidget(screenScrollLocation: _mainPageScrollPosition, widgetScrollLocation: _scrollPosition)
                          : const SizedBox(),
                      const SizedBox(height: 20),
                      _isConnected ? Text(
                        ScreenContext.headers[2],
                        style: const TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 21,
                          color: ColorRepo.dark,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      )
                          : const SizedBox(),
                      SizedBox(height: _isConnected ? 20 : 0),
                      _isConnected ? const ProductCarouselLiteWidget(products: ListRepo.products)
                          : const SizedBox(),
                      SizedBox(height: _isConnected ? 40 : 0),
                      _isConnected
                          ? Text(
                        ScreenContext.headers[1],
                        style: const TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 21,
                          color: ColorRepo.dark,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      )
                          : const SizedBox(),
                      SizedBox(height: _isConnected ? 20 : 0),
                    ],
                  ),
                ),
                _isConnected
                    ? Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: RadiiRepo.screenPadding,
                        right: RadiiRepo.screenPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _isPageLoading ? const ProductGridShimmerWidget() : const ProductGridWidget(products: ListRepo.products),
                        ],
                      ),
                    ),
                  ),
                )
                    : NoInternetWidget(onRetry: _retryConnection),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static const List<String> headers = [
    'Categories',
    'Top Picks',
    'Your Recent Shopping Trends',
  ];

  static const List<String> inputPlaceholders = [
    'food stuffs, groceries and more',
  ];
}
