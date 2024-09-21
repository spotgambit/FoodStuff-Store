
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/ListRepo.dart';
import '../Screens/FavoriteScreens/FavoriteListScreen.dart';
import '../Utils/StringFormatterHelper.dart';
import 'CustomDivider.dart';

class ShoppingListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> listItems;

  const ShoppingListWidget({super.key, required this.listItems});

  @override
  State<ShoppingListWidget> createState() => _ShoppingListWidgetState();
}

class _ShoppingListWidgetState extends State<ShoppingListWidget> {



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
          itemCount: widget.listItems.length,
          itemBuilder: (context, index) => _buildSummaryItem(widget.listItems[index], index, screenWidth),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildSummaryItem(Map<String, dynamic> listItem, int index, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FavoriteListScreen(listItems: ListRepo.products, pagetitle: listItem['name'])),
          );
        },
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
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
                                    listItem['image1'],
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                                    listItem['image2'],
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Row(
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
                                    listItem['image3'],
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                                    listItem['image4'],
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listItem['name'],
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: ColorRepo.dark,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${listItem['items']} items',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: ColorRepo.muted,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    PhosphorIcons.caret_right,
                    color: ColorRepo.dark,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const CustomDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
