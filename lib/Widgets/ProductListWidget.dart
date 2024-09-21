import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/BottomSheets/ShoppingListOptionMenuBottomSheetWidget.dart';
import '../Repo/ColorRepo.dart';
import '../Utils/StringFormatterHelper.dart';
import 'CustomDivider.dart';

class ProductListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  const ProductListWidget({super.key, required this.products});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 150),
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
        height: 100,
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
                            product['image'],
                            height: 70,
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
                              product['name'],
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: ColorRepo.dark,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  StringFormatHelper.formatBalance(product['discount']),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: ColorRepo.dark,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  StringFormatHelper.formatBalance(product['price']),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: ColorRepo.muted,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => const ShoppingListOptionMenuBottomSheetWidget(),
                    );
                  },
                  child: const Icon(
                    PhosphorIcons.dots_three_outline_vertical,
                    color: ColorRepo.dark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
