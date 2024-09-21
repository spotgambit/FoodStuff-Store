import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/BottomSheets/ShoppingListOptionMenuBottomSheetWidget.dart';
import '../Repo/ColorRepo.dart';
import '../Utils/StringFormatterHelper.dart';
import 'CustomDivider.dart';

class SearchProductListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  final Function action;

  const SearchProductListWidget({super.key, required this.products, required this.action});

  @override
  State<SearchProductListWidget> createState() => _SearchProductListWidgetState();
}

class _SearchProductListWidgetState extends State<SearchProductListWidget> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SizedBox(
        width: screenWidth,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 40),
          itemCount: widget.products.length,
          itemBuilder: (context, index) => _buildSummaryItem(widget.products[index], index, screenWidth),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildSummaryItem(Map<String, dynamic> product, int index, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 40,
        width: screenWidth,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.7,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: ColorRepo.mutedLite2,
                            width: 1.0,
                          ),
                        ),
                        child: Image.network(
                          product['image'],
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        product['name'],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: ColorRepo.dark,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    widget.action();
                  },
                  child: const Icon(
                    PhosphorIcons.arrow_up_right,
                    color: ColorRepo.muted,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
