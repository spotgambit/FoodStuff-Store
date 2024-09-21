import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/QuantityInputWidget.dart';
import '../Repo/ColorRepo.dart';
import '../Utils/StringFormatterHelper.dart';

class OrderSummaryListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  const OrderSummaryListWidget({super.key, required this.products});

  @override
  State<OrderSummaryListWidget> createState() => _OrderSummaryListWidgetState();
}

class _OrderSummaryListWidgetState extends State<OrderSummaryListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 150),
        itemCount: widget.products.length,
        itemBuilder: (context, index) => _buildSummaryItem(widget.products[index], index, screenWidth),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildSummaryItem(Map<String, dynamic> product, int index, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: ColorRepo.mutedLite2,
                    width: 1.0,
                  ),
                ),
                child: Image.network(
                  product['image'],
                  height: 100,
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
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          'Quantity: ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorRepo.muted,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '1',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    StringFormatHelper.formatBalance(17000),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: ColorRepo.dark,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
