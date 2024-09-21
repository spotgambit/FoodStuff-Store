import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/QuantityInputWidget.dart';
import '../Repo/ColorRepo.dart';
import '../Utils/StringFormatterHelper.dart';

class SingleProductWidget extends StatefulWidget {
  final String image;
  final String name;
  final double discount;

  const SingleProductWidget({super.key, required this.image, required this.name, required this.discount});

  @override
  State<SingleProductWidget> createState() => _SingleProductWidgetState();
}

class _SingleProductWidgetState extends State<SingleProductWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              height: 70,
              width: 70,
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: ColorRepo.mutedLite2,
                  width: 1.0,
                ),
              ),
              child: Image.network(
                widget.image,
                height: 70 ,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: ColorRepo.dark,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  StringFormatHelper.formatBalance(17000),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: ColorRepo.dark,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
