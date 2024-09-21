import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../../Utils/StringFormatterHelper.dart';
import '../BottomSheetHandle.dart';
import '../CustomDivider.dart';
import '../DeliveryInfo3Widget.dart';
import '../QuantityInputWidget.dart';

class ProductDescriptionBottomSheetWidget extends StatefulWidget {
  final String image;
  final String name;
  final double discount;
  final String category;

  const ProductDescriptionBottomSheetWidget({super.key, required this.image, required this.name, required this.discount, required this.category});


  @override
  State<ProductDescriptionBottomSheetWidget> createState() => _ProductDescriptionBottomSheetWidgetState();
}

class _ProductDescriptionBottomSheetWidgetState extends State<ProductDescriptionBottomSheetWidget> {

  String username = "Boma";
  String address = "Kado Estate, FCT, Abuja";
  int _quantity = 1;

  final TextEditingController _quantityController = TextEditingController();

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

  void _addToCart() {
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quantityController.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 750,
      width: screenWidth,
      padding: const EdgeInsets.all(RadiiRepo.screenPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiiRepo.bottomSheetBorderRadius),
        color: ColorRepo.background,
      ),
      child: SizedBox(
        height: 720,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomSheetHandle(),
                const SizedBox(height: 20),
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
                const SizedBox(height: 10),
                SizedBox(
                  width: screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 204,
                        width: screenWidth * 0.7,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: ColorRepo.muted,
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
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 18,
                    color: ColorRepo.dark,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
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
                const SizedBox(height: 10),
                const CustomDivider(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      PhosphorIcons.minus_circle,
                      color: ColorRepo.primary2,
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      ScreenContext.linkText[0],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.dark,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Icon(
                      PhosphorIcons.plus_circle,
                      color: ColorRepo.primary2,
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      ScreenContext.linkText[1],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.dark,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Icon(
                      PhosphorIcons.article,
                      color: ColorRepo.primary2,
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      ScreenContext.linkText[2],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.dark,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth,
                color: ColorRepo.background,
                padding: const EdgeInsets.only(top: RadiiRepo.screenPadding),
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
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenContext{
  static const double _premiumPrice = 999.00;
  static const String exitText = "Cancel";

  static const List<String> btnText = [
    'Add to cart',
  ];

  static const List<String> linkText = [
    'Remove from shopping list',
    'Add to other shopping list',
    'View item details',
  ];
}