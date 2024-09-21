import 'package:flutter/material.dart';
import 'package:groceryshop/Repo/ColorRepo.dart';
import 'package:groceryshop/Screens/DescriptionScreens/DescriptionScreen.dart';

class ProductCarouselLiteWidget extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  final double width;
  final double imageSize;
  final Function(Map<String, dynamic> product)? callBackFunction;
  final bool useCallBackFunction;

  const ProductCarouselLiteWidget({
    super.key,
    required this.products,
    this.width = 0,
    this.imageSize = 0,
    this.callBackFunction,
    this.useCallBackFunction = false,
  });

  @override
  _ProductCarouselLiteWidgetState createState() => _ProductCarouselLiteWidgetState();
}

class _ProductCarouselLiteWidgetState extends State<ProductCarouselLiteWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widget.width < 1 ? screenWidth : widget.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            widget.products.length,
                (index) => _buildTextPill(widget.products.length, index, widget.products[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildTextPill(int totalItems, int index, Map<String, dynamic> product) {
    return Padding(
      padding: EdgeInsets.only(right: widget.products.length == index + 1 ? 80 : 8.0),
      child: GestureDetector(
        onTap: () {
          if(widget.useCallBackFunction)
          {
            if (widget.callBackFunction != null){
              widget.callBackFunction!(product);
            }
          }else{
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DescriptionScreen(
                  image: product['image'],
                  name: product['name'],
                  weight: product['weight'],
                  price: product['price'],
                  discount: product['discount'],
                  description: product['description'],
                  category: product['category'],
                ),
              ),
            );
          }
        },
        child: Container(
          height: widget.imageSize < 1 ? 100 : widget.imageSize,
          width: widget.imageSize < 1 ? 100 : widget.imageSize,
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: ColorRepo.mutedLite2,
              width: 1.0,
            ),
          ),
          child: Image.network(
            product['image'],
            height: widget.imageSize < 1 ? 120 : widget.imageSize,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
