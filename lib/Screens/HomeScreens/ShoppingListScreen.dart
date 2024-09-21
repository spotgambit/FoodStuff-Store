import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/BottomSheets/CreateShoppingListScreen.dart';
import 'package:groceryshop/Widgets/BottomSheets/FilterShoppingListBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/ShoppingListWidget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../Repo/ColorRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/CustomDivider.dart';
import '../../Widgets/NoInternetWidget.dart';
import '../../Widgets/ProductListShimmerWidget.dart';
import '../../Widgets/SearchInputWidget.dart';
import '../../Widgets/SquareGradientIcon.dart';
import '../FavoriteScreens/FavoriteListScreen.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  int totalLikedItems = 0;
  int totalShoppingLists = 0;

  bool _isPageLoading = true;
  bool _isConnected = true;
  final TextEditingController _searchController = TextEditingController();

  Future<void> _refreshPage() async{
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

  void _searchFoodStuff(){

  }

  void _navigateTo(int screenIndex){
    switch(screenIndex){
      case 0:
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const CreateShoppingListBottomSheet(),
        );
        break;

      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const FavoriteListScreen(listItems: ListRepo.products, pagetitle: 'Favorites')),
        );
        break;

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalLikedItems = 32;
    totalShoppingLists = 5;

    _checkInternetConnection();
    // Set _isPageLoading to false after 5 seconds
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _isPageLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,	// key if you want to add
        onRefresh: _refreshPage,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: screenHeight + 200,
            width: screenWidth, // Adjust the width to allow horizontal scrolling
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: RadiiRepo.whenNoAppBarButSearchInputUnderPadding,
                    left: RadiiRepo.screenPadding,
                    right: RadiiRepo.screenPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      SearchInputWidget(
                        screenWidth: screenWidth,
                        hintText: ScreenContext.inputPlaceholders[0],
                        controller: _searchController,
                        isValid: true,
                        onSearch: _searchFoodStuff,
                        onChange: (){}
                      ),
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
                              _navigateTo(0);
                            },
                            child: const Icon(
                              PhosphorIcons.plus_circle,
                              color: ColorRepo.primary2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        ScreenContext.headerText[1],
                        style: const TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 11,
                          color: ColorRepo.muted,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height:10),
                      GestureDetector(
                        onTap: (){
                          _navigateTo(1);
                        },
                        child: const SquareGradientIcon(icon: Icon(
                            PhosphorIcons.heart_fill,
                            color: ColorRepo.background,
                            size: 20), height: 44, width: 44),
                      ),
                      const SizedBox(height:10),
                      Row(
                        children: [
                          const Icon(
                            PhosphorIcons.push_pin_fill,
                            color: ColorRepo.dark,
                            size: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '$totalLikedItems Liked Items',
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 11,
                              color: ColorRepo.muted,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const CustomDivider(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                ScreenContext.headerText[2],
                                style: const TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  color: ColorRepo.dark,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                ' $totalShoppingLists',
                                style: const TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  color: ColorRepo.muted,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          GestureDetector(
                              onTap: (){
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (_) => const FilterShoppingListBottomSheetWidget(),
                                );
                              },
                              child: const Icon(PhosphorIcons.funnel_simple, color: ColorRepo.dark)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _isPageLoading
                          ? const ProductListShimmerWidget()
                          : !_isConnected
                          ? NoInternetWidget(onRetry: _retryConnection)
                          : SizedBox(
                        height: screenHeight * 0.77,
                        child: const ShoppingListWidget(
                            listItems: ListRepo.shoppingLists
                        ),
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
  static const List<String> headerText = [
    'My Shopping List',
    'Default',
    'All List,',
  ];

  static const List<String> inputPlaceholders = [
    'food stuffs, groceries and more',
  ];
}
