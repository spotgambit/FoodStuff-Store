import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Repo/ColorRepo.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'package:groceryshop/Widgets/BottomSheets/AddToShoppingListBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/LikeButton.dart';

import '../Screens/DescriptionScreens/DescriptionScreen.dart';
import 'CustomSnackbar.dart';

class ProductGridWidget extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  const ProductGridWidget({super.key, required this.products});

  @override
  State<ProductGridWidget> createState() => _ProductGridWidgetState();
}

class _ProductGridWidgetState extends State<ProductGridWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: widget.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) => _buildProductContainer(widget.products[index], screenHeight),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildProductContainer(Map<String, dynamic> product, double screenHeight) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DescriptionScreen(image: product['image'], name: product['name'], weight: product['weight'], price: product['price'], discount: product['discount'], description: product['description'], category: product['category'])),
                        );
                      },
                      child: Image.network(
                        product['image'],
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: LikeButton(
                        isLiked: false,
                        size: 21,
                        onLikeChanged: (isLiked) {
                          if(isLiked){
                            ScaffoldMessenger.of(context).showSnackBar(
                              CustomSnackBar.create(
                                icon: const Icon(PhosphorIcons.check_circle_fill, color: Color.fromARGB(255, 255, 224, 227)),
                                mainText: 'Item added to list',
                                subText: 'Change',
                                screenHeight: screenHeight,
                                action: (){
                                  print("It works just fine yo!!!");
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (_) => const AddToShoppingListBottomSheetWidget(),
                                  );
                                }
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DescriptionScreen(image: product['image'], name: product['name'], weight: product['weight'], price: product['price'], discount: product['discount'], description: product['description'], category: product['category'])),
                    );
                  },
                  child: Text(
                    product['name'],
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      color: ColorRepo.dark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DescriptionScreen(image: product['image'], name: product['name'], weight: product['weight'], price: product['price'], discount: product['discount'], description: product['description'], category: product['category'])),
                        );
                      },
                      child: Text(
                        StringFormatHelper.formatBalanceLite(product['price']),
                        style: const TextStyle(
                          fontSize: 14,
                          color: ColorRepo.dark,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      StringFormatHelper.formatBalanceLite(product['discount']),
                      style: const TextStyle(
                        fontSize: 11,
                        color: ColorRepo.muted,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}