import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/BottomSheets/CartOptionMenuBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/QuantityInputWidget.dart';
import '../Repo/ColorRepo.dart';
import '../Utils/StringFormatterHelper.dart';

class CartListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  final List<TextEditingController> controllers;

  const CartListWidget({super.key, required this.products, required this.controllers});

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _addQuantity(int index) {
    setState(() {
      int currentQuantity = int.parse(widget.controllers[index].text);
      if (currentQuantity < 10) {
        widget.controllers[index].text = (currentQuantity + 1).toString();
      }
    });
  }

  void _removeQuantity(int index) {
    setState(() {
      int currentQuantity = int.parse(widget.controllers[index].text);
      if (currentQuantity > 1) {
        widget.controllers[index].text = (currentQuantity - 1).toString();
      }
    });
  }

  void _deleteItem(int index) {
    setState(() {
      widget.products.removeAt(index);
      widget.controllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 150),
        itemCount: widget.products.length,
        itemBuilder: (context, index) => _buildCartItem(widget.products[index], widget.controllers[index], index, screenWidth),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> product, TextEditingController quantityController, int index, double screenWidth) {
    double discount = double.parse(product['discount'].toString());
    if(quantityController.text.length == 0 || quantityController.text == '0'){
      quantityController.text = '1';
    }

    double quantity = double.parse(quantityController.text);

    double totalAmount = quantity * discount;

    return Dismissible(
      key: Key(product['id'].toString()),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        // Return false to prevent the item from being dismissed
        return false;
      },
      background: Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: ColorRepo.primaryDark,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Icon(
                PhosphorIcons.trash,
                color: ColorRepo.background,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40.0),
              child: Text(
                'Delete',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: ColorRepo.background,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 220,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  height: 140,
                  width: 140,
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
                    height: 150,
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
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 10),
                      child: Text(
                        'Price per weight',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorRepo.muted,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.normal,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorRepo.background,
                        border: Border.all(color: ColorRepo.mutedLite2),
                        borderRadius: BorderRadius.circular(30), // Pill shape
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        '1 Kg • ${StringFormatHelper.formatBalanceLite(discount)}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: ColorRepo.dark,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(
                              PhosphorIcons.minus_circle,
                              color: ColorRepo.muted,
                            ),
                            onPressed: () {
                              _removeQuantity(index);
                            },
                            iconSize: 24.0,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          QuantityInputWidget(quantityController: quantityController),
                          IconButton(
                            icon: const Icon(
                              PhosphorIcons.plus_circle,
                              color: ColorRepo.dark,
                            ),
                            onPressed: () {
                              _addQuantity(index);
                            },
                            iconSize: 24.0,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      StringFormatHelper.formatBalance(totalAmount),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: ColorRepo.dark,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
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
                    builder: (_) => const CartOptionMenuBottomSheetWidget(),
                  );
                },
                child: const Icon(
                  PhosphorIcons.dots_three_outline_vertical_bold,
                  color: ColorRepo.dark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
