import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Repo/ImageRepo.dart';
import 'package:groceryshop/Repo/ListRepo.dart';
import 'package:groceryshop/Screens/Membership/MembershipOnboardingScreen.dart';
import 'package:groceryshop/Widgets/CustomDivider.dart';
import 'package:groceryshop/Widgets/SearchHistoryListWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/CustomSearchAppBar.dart';
import '../../Widgets/SearchProductListWidget.dart';

class SearchScreen extends StatefulWidget {
  final String keyword;

  const SearchScreen({super.key, required this.keyword});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool doesKeywordHasMatch = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      appBar: CustomSearchAppBar(
        searchController: _searchController,
        onSearch: (){}, onChange: (){},
      ),
      body: Stack(
        children: [
          SizedBox(
            height: screenheight * 0.88,
            width: screenWidth,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: RadiiRepo.appBarUnderPaddingLite,
                  left: RadiiRepo.screenPadding,
                  right: RadiiRepo.screenPadding,
                ),
                child: doesKeywordHasMatch ? Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ScreenContext.headerText[2],
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: ColorRepo.muted,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: ColorRepo.transparent),
                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(PhosphorIcons.trash, color: ColorRepo.dark, size: 16),
                                  const SizedBox(width: 5),
                                  Text(
                                    ScreenContext.buttonText[0],
                                    style: const TextStyle(
                                      color: ColorRepo.dark,
                                      fontFamily: 'Urbanist',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SearchHistoryListWidget(history: ListRepo.searchHistory, action: (){},),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const CustomDivider(),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ScreenContext.headerText[1],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.muted,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SearchProductListWidget(products: ListRepo.products, action: (){},),
                      ],
                    ),
                  ],
                ) : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageRepo.basket, height: 150,),
                    const SizedBox(height: 10),
                    Text(
                      ScreenContext.headerText[0],
                      style: const TextStyle(
                          fontFamily: 'MadeGentle',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: ColorRepo.dark
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ScreenContext.subHeadingText[0],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 24,
                        color: ColorRepo.dark,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ScreenContext.bodyText[0],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.muted,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
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
  static const List<String> headerText = [
    'Oops!',
    'Trending searches',
    'Search history',
  ];

  static const List<String> subHeadingText = [
    'No product found',
  ];

  static const List<String> bodyText = [
    'Please check your spelling.',
  ];

  static const List<String> buttonText = [
    'Clear search',
  ];
}
