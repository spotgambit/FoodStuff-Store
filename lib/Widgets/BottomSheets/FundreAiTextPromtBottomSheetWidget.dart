import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/CustomDivider.dart';
import '../../Repo/ImageRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';
import '../CustomTextArea.dart';
import '../MessageTextArea.dart';
import '../ProductCarouselWidget.dart';
import '../QuantityInputWidget.dart';
import '../UserAvatarSmallWidget.dart';
import 'FundreAiWelcomeBottomSheetWidget.dart';

class FundreAiTextPromtBottomSheetWidget extends StatefulWidget {
  const FundreAiTextPromtBottomSheetWidget({super.key});

  @override
  State<FundreAiTextPromtBottomSheetWidget> createState() => _FundreAiTextPromtBottomSheetWidgetState();
}

class _FundreAiTextPromtBottomSheetWidgetState extends State<FundreAiTextPromtBottomSheetWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  TextEditingController _quantityController = TextEditingController();

  String selectedProductImage = "";
  double selectedProductPrice = 0.00;
  String selectedProductName = "" ;
  String selectedProductDescription = "";
  bool _isLoadingAddToCart = false;
  bool _isItemAddedToCartSuccessfully = false;

  int _selectedReactionIndex = 0;

  String fullName = "Boma Dokubo";
  String email = "bomadokubo@gmail.com";
  String profilePicture = "https://example.com/user_avatar.png";

  @override
  void initState() {
    super.initState();
    _quantityController.text = "1";
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _addToCart(){
    setState(() {
      _isLoadingAddToCart = true;
    });

    Timer(const Duration(seconds: 5), () {
      setState(() {
        _isLoadingAddToCart = false;
        _isItemAddedToCartSuccessfully = true;
      });
    });
  }

  void _navigateTo(int screen) {
    switch (screen) {
      case 0:
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const FundreAiWelcomeBottomSheetWidget(),
        );
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  void _addQuantity() {
    setState(() {
      int currentQuantity = int.parse(_quantityController.text);
      if (currentQuantity < 10) {
        _quantityController.text = (currentQuantity + 1).toString();
      }
    });
  }

  void _removeQuantity() {
    setState(() {
      int currentQuantity = int.parse(_quantityController.text);
      if (currentQuantity > 1) {
        _quantityController.text = (currentQuantity - 1).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      body: Container(
        color: ColorRepo.background,
        child: Padding(
          padding: const EdgeInsets.all(RadiiRepo.screenPadding),
          child: SizedBox(
            height: 717,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomSheetHandle(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            _navigateTo(0);
                          },
                          child: const Icon(
                            PhosphorIcons.caret_left,
                            color: ColorRepo.dark,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(ImageRepo.fundreAiLogoMain, height: 20,),
                            const SizedBox(width: 5),
                            Text(
                              ListRepo.companyInfo[0]["AI-Name"],
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: ColorRepo.dark,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Text(
                            ScreenContext.exitText,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Image.asset(ImageRepo.chatLineIcon, height: 56,),
                          const SizedBox(width: 5,),
                          Text(
                            ScreenContext.headerText[0],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: ColorRepo.muted2),
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
                      ],),
                    SlideTransition(
                      position: _offsetAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ScreenContext.headerText[1],
                              style: const TextStyle(
                                color: ColorRepo.primary2,
                                fontFamily: 'Urbanist',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              ScreenContext.bodyText[0],
                              style: const TextStyle(
                                color: ColorRepo.dark,
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height:20),
                    const CustomDivider(),
                    const SizedBox(height:20),
                    selectedProductImage.isNotEmpty ? const SizedBox() : SizedBox(
                      height: screenHeight * 0.50,
                      width: screenWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(ImageRepo.fundreAiLogoChat),
                              const SizedBox(width: 10),
                              const Text(
                                "What do you need help with today?",
                                style: TextStyle(
                                  color: ColorRepo.dark,
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height:20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                                  border: Border.all(color: ColorRepo.muted2, width: 0.5),
                                  color: ColorRepo.mutedLite,
                                ),
                                child: const Text(
                                  "I want a freshly peeled corn",
                                  style: TextStyle(
                                    color: ColorRepo.dark,
                                    fontFamily: 'Urbanist',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              UserAvatarSmallWidget(
                                imageUrl: profilePicture,
                                fullName: fullName,
                              ),
                            ],
                          ),
                          const SizedBox(height:20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Keep shopping these trends",
                                    style: TextStyle(
                                      color: ColorRepo.dark,
                                      fontFamily: 'Urbanist',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height:20),
                                  SizedBox(
                                    width: screenWidth - 82,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: ProductCarouselLiteWidget(
                                        products: ListRepo.products,
                                        imageSize: 56,
                                        useCallBackFunction: true,
                                        callBackFunction: (product) {
                                          setState(() {
                                            selectedProductImage = product['image'];
                                            selectedProductPrice = product['price'];
                                            selectedProductName = product['name'];
                                            selectedProductDescription = product['description'];
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],),
                    ),
                    selectedProductImage.isEmpty ? const SizedBox() : SlideTransition(
                      position: _offsetAnimation,
                      child: SizedBox(
                        height: screenHeight * 0.56,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(ImageRepo.fundreAiLogoChat),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${ListRepo.companyInfo[0]["AI-Name"]} Result",
                                        style: const TextStyle(
                                          color: ColorRepo.muted,
                                          fontFamily: 'Urbanist',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height:10),
                                      Row(
                                        children: [
                                          Container(
                                            height: 56,
                                            width: 56,
                                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(
                                                color: ColorRepo.mutedLite2,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Image.network(
                                              selectedProductImage,
                                              height: 56,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                selectedProductName,
                                                style: const TextStyle(
                                                  color: ColorRepo.dark,
                                                  fontFamily: 'Urbanist',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 10,),
                                              Text(
                                                "₦$selectedProductPrice",
                                                style: const TextStyle(
                                                  color: ColorRepo.dark,
                                                  fontFamily: 'Urbanist',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Container(width: screenWidth - 80, height: 1, color: ColorRepo.muted2),
                                      const SizedBox(height: 10),
                                      const Text(
                                        "Description",
                                        style: TextStyle(
                                          color: ColorRepo.muted,
                                          fontFamily: 'Urbanist',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: screenWidth * 0.77,
                                        child: Text(
                                          selectedProductDescription,
                                          style: const TextStyle(
                                            color: ColorRepo.dark,
                                            fontFamily: 'Urbanist',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Row(
                                        children: [
                                          Text(
                                            "More info",
                                            style: TextStyle(
                                              color: ColorRepo.link,
                                              fontFamily: 'Urbanist',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Icon(PhosphorIcons.arrow_up_right, color: ColorRepo.link, size: 16),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Container(width: screenWidth - 80, height: 1, color: ColorRepo.muted2),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: screenWidth * 0.78,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
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
                                                QuantityInputWidget(quantityController: _quantityController),
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
                                            _isLoadingAddToCart ? const Row(children: [
                                              SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: CircularProgressIndicator(
                                                  valueColor:
                                                  AlwaysStoppedAnimation<Color>(ColorRepo.primary2),
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Text(
                                                "Adding item",
                                                style: TextStyle(
                                                  color: ColorRepo.primary2,
                                                  fontFamily: 'Urbanist',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],) : _isItemAddedToCartSuccessfully ? const Row(children: [
                                              Icon(
                                                PhosphorIcons.check_circle_fill,
                                                color: ColorRepo.successDark,
                                              ),
                                              SizedBox(width: 10,),
                                              Text(
                                                "Item Added",
                                                style: TextStyle(
                                                  color: ColorRepo.dark,
                                                  fontFamily: 'Urbanist',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],) : GestureDetector(
                                              onTap: (){
                                                _addToCart();
                                              },
                                              child: const Row(children: [
                                                Text(
                                                  "Add to cart",
                                                  style: TextStyle(
                                                    color: ColorRepo.dark,
                                                    fontFamily: 'Urbanist',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Icon(
                                                  PhosphorIcons.shopping_cart,
                                                  color: ColorRepo.primary2,
                                                ),
                                              ],),
                                            )
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 60),
                              _isItemAddedToCartSuccessfully ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "How did we do? Help us get better",
                                    style: TextStyle(
                                      color: ColorRepo.dark,
                                      fontFamily: 'Urbanist',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: screenWidth,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              _selectedReactionIndex = 1;
                                            });
                                          },
                                          child: Icon(
                                            _selectedReactionIndex == 1 ? PhosphorIcons.smiley_wink_fill : PhosphorIcons.smiley_wink,
                                            color: _selectedReactionIndex == 1 ? ColorRepo.dark : ColorRepo.muted,
                                            size: 24,
                                          ),
                                        ),
                                        const SizedBox(width: 20,),
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              _selectedReactionIndex = 2;
                                            });
                                          },
                                          child: Icon(
                                            _selectedReactionIndex == 2 ? PhosphorIcons.smiley_nervous_fill : PhosphorIcons.smiley_nervous,
                                            color: _selectedReactionIndex == 2 ? ColorRepo.dark : ColorRepo.muted,
                                            size: 24,
                                          ),
                                        ),
                                      ],),
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextArea(labelText: ScreenContext.labelText[0], hintText: ScreenContext.hintText[0]),
                                  const SizedBox(height: 320),
                                ],
                              ) : const SizedBox()
                            ],),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 100,
        width: screenWidth,
        color: ColorRepo.background,
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: Row(children: [
          MessageTextArea(hintText: ScreenContext.hintText[1]),
        ],),
      ),
    );
  }
}

class ScreenContext {
  static const String exitText = "Cancel";
  static List<String> headerText = ["Text prompts", "Hi, I'm ${ListRepo.companyInfo[0]["AI-Name-Short"]}!"];
  static List<String> bodyText = ["I will be taking your order requests. My answers are powered by AI, so i may not always get things right."];
  static const List<String> buttonText = ["Clear Chat"];

  static const List<String> labelText = [
    'Write your review',
  ];

  static const List<String> hintText = [
    '...type in here',
    '...type prompt here',
  ];
}
