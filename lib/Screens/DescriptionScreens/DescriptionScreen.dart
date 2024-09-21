import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/DescriptionScreens/ReviewsScreen.dart';
import 'package:groceryshop/Widgets/BottomSheets/WriteReviewScreen.dart';
import 'package:groceryshop/Widgets/DeliveryInfo3Widget.dart';
import 'package:groceryshop/Widgets/RateProductWidget.dart';
import 'package:groceryshop/Widgets/ReviewListWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Utils/StringFormatterHelper.dart';
import '../../Widgets/CustomDivider.dart';
import '../../Widgets/CustomSearchAppBar.dart';
import '../../Widgets/LikeButton.dart';
import '../../Widgets/ProductCarouselWidget.dart';
import '../../Widgets/QuantityInputWidget.dart';
import '../../Widgets/RoundGradientIcon.dart';

class DescriptionScreen extends StatefulWidget {
  final String image;
  final String name;
  final String weight;
  final double price;
  final double discount;
  final String description;
  final String category;

  const DescriptionScreen({super.key, required this.image, required this.name, required this.weight, required this.price, required this.discount, required this.description, required this.category});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  String username = "Boma";
  String address = "Kado Estate, FCT, Abuja";
  int totalReviews = 5;

  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  int _quantity = 1;

  bool _isPageLoading = true;

  @override
  void initState() {
    super.initState();
    _quantityController.text = "1";
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _isPageLoading = false;
      });
    });
  }

  void _navigateTo(int screenIndex){
    switch(screenIndex){
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ReviewsScreen(image: widget.image, name: widget.name, discount: widget.discount)),
        );
        break;

      case 1:
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => WriteReviewBottomSheet(image: widget.image, name: widget.name, discount: widget.discount),
        );
        break;

    }
  }

  void _searchFoodStuff(){

  }

  void _addQuantity() {
    setState(() {
      if (_quantity < 10) {
        _quantity = _quantity + 1;
        _quantityController.text = _quantity.toString();
      }
    });
  }

  void _removeQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity = _quantity - 1;
        _quantityController.text = _quantity.toString();
      }
    });
  }

  void _addToCart(){

  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double totalAmount = _quantity * widget.discount;

    return Scaffold(
      backgroundColor: ColorRepo.background,
      appBar: CustomSearchAppBar(
        searchController: _searchController,
        onSearch: _searchFoodStuff, onChange: (){},
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
                    Container(
                      height: screenWidth - 100,
                      width: screenWidth,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: ColorRepo.mutedLite2,
                          width: 1.0,
                        ),
                      ),
                      child: Image.network(
                        widget.image,
                        height: screenWidth,
                        width: screenWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.category,
                          style: const TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 12,
                            color: ColorRepo.dark,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        LikeButton(
                          isLiked: false,
                          size: 30,
                          onLikeChanged: (isLiked) {
                            // Handle the like button tap here
                          },
                        ),
                      ],
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 18,
                        color: ColorRepo.dark,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      ScreenContext.labelText[0],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        color: ColorRepo.muted,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorRepo.background,
                              border: Border.all(color: ColorRepo.dark),
                              borderRadius: BorderRadius.circular(30), // Pill shape
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              '1 Kg • ${StringFormatHelper.formatBalance(widget.discount)}',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: ColorRepo.dark,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: ColorRepo.background,
                              border: Border.all(color: ColorRepo.mutedLite2),
                              borderRadius: BorderRadius.circular(30), // Pill shape
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  '2.5 Kg • ${StringFormatHelper.formatBalance(widget.discount)}',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: ColorRepo.dark,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  StringFormatHelper.formatBalanceLite(widget.price),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: ColorRepo.muted,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CustomDivider(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringFormatHelper.formatBalance(widget.discount),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(
                                PhosphorIcons.minus_circle,
                                color: ColorRepo.muted,
                              ),
                              onPressed: () {
                                _removeQuantity();
                              },
                              iconSize: 24.0,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            const SizedBox(width: 5),
                            QuantityInputWidget(quantityController: _quantityController),
                            const SizedBox(width: 5),
                            IconButton(
                              icon: const Icon(
                                PhosphorIcons.plus_circle,
                                color: ColorRepo.dark,
                              ),
                              onPressed: () {
                                _addQuantity();
                              },
                              iconSize: 24.0,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    DeliveryInfo3(
                      address: address,
                      width: screenWidth,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: screenWidth,
                      child: ElevatedButton(
                        onPressed: _addToCart,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorRepo.primary2,
                          padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ScreenContext.btnText[0],
                              style: const TextStyle(
                                color: ColorRepo.background,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              PhosphorIcons.shopping_cart,
                              color: ColorRepo.background,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ScreenContext.headerText[0],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        const Icon(
                          PhosphorIcons.caret_down,
                          size: 30  ,
                          color: ColorRepo.dark,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        child: Text(
                        widget.description,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: ColorRepo.dark,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),),
                    ),
                    const SizedBox(height: 20),
                    const CustomDivider(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const RoundGradientIcon(icon: Icon(
                          PhosphorIcons.shopping_bag,
                          color: ColorRepo.primaryDark,
                          size: 30), height: 44, width: 44),
                        const SizedBox(width: 10),
                        Text(
                          ScreenContext.headerText[3],
                          style: const TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 16,
                            color: ColorRepo.dark,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: Text(
                        ScreenContext.bodyText[0],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: ColorRepo.dark,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),),
                    const SizedBox(height: 40),
                    !_isPageLoading ? Text(
                      ScreenContext.headerText[1],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 21,
                        color: ColorRepo.dark,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    )
                        : const SizedBox(),
                    const SizedBox(height: 10),
                    !_isPageLoading ? const ProductCarouselLiteWidget(products: ListRepo.products)
                        : const SizedBox(),
                    const SizedBox(height: 20),
                    const CustomDivider(),
                    const SizedBox(height: 20),
                    Text(
                      ScreenContext.headerText[2],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 18,
                        color: ColorRepo.dark,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    const RateProductWidget(),
                    const SizedBox(height: 10),
                    Text(
                      '$totalReviews reviews',
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 18,
                        color: ColorRepo.muted,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    const ReviewListWidget(reviews: ListRepo.reviews),
                    GestureDetector(
                      onTap: (){
                        _navigateTo(0);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ScreenContext.linkText[0],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 18,
                              color: ColorRepo.dark,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            PhosphorIcons.arrow_right,
                            color: ColorRepo.dark,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: (){
                        _navigateTo(1);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ScreenContext.linkText[1],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 18,
                              color: ColorRepo.dark,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            PhosphorIcons.arrow_right,
                            color: ColorRepo.dark,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
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
  static String pageTitle = 'Order Summary';

  static const List<String> headerText = [
    'About Item',
    'You may also like',
    'Customers Reviews',
    'Support Small Business / Farmers',
  ];

  static const List<String> labelText = [
    'Price per weight:',
  ];

  static const List<String> bodyText = [
    'Buy from us today and contribute to supporting small businesses and farmers across the country.',
  ];

  static const List<String> btnText = [
    'Add to cart',
  ];

  static const List<String> linkText = [
    'See more reviews',
    'Write a reviews',
  ];
}
