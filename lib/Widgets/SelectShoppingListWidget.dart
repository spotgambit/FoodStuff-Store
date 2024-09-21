import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/Enums/Shapes.dart';
import '../Repo/ListRepo.dart';
import '../Screens/FavoriteScreens/FavoriteListScreen.dart';
import '../Utils/StringFormatterHelper.dart';
import 'CustomDivider.dart';
import 'RadioButtonWidget.dart';

class SelectShoppingListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> listItems;

  const SelectShoppingListWidget({super.key, required this.listItems});

  @override
  State<SelectShoppingListWidget> createState() => _SelectShoppingListWidgetState();
}

class _SelectShoppingListWidgetState extends State<SelectShoppingListWidget> {
  List<int> selectedOptions = [];

  @override
  void initState() {
    super.initState();

    // Initialize selectedOptions with default values (0 for unselected)
    selectedOptions = List.generate(widget.listItems.length, (index) => 0);
  }

  void _chooseList(int index) {
    setState(() {
      selectedOptions[index] = selectedOptions[index] == 0 ? 1 : 0;
    });
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
    // Safely parse the list item ID to avoid radix errors
    int listItemId;
    try {
      listItemId = int.parse(listItem['id'].toString());
    } catch (e) {
      listItemId = -1; // Set a default value if parsing fails
      print('Error parsing list item ID: ${listItem['id']}');
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FavoriteListScreen(
                listItems: ListRepo.products,
                pagetitle: listItem['name'],
              ),
            ),
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
                        _buildImageColumn(listItem),
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
                  RadioButtonWidget(
                    selected: selectedOptions.isNotEmpty && selectedOptions[index] == 1,
                    baseColor: ColorRepo.transparent,
                    unSelectedBgColor: ColorRepo.background,
                    selectedBgColor: ColorRepo.dark,
                    selectedBorderColor: ColorRepo.dark,
                    unSelectedBorderColor: ColorRepo.dark,
                    onTap: () {
                      _chooseList(index);
                    },
                    shape: Shapes.circle,
                  )
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

  // Helper method to build a column with images
  Widget _buildImageColumn(Map<String, dynamic> listItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildImageContainer(listItem['image1']),
            _buildImageContainer(listItem['image2']),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildImageContainer(listItem['image3']),
            _buildImageContainer(listItem['image4']),
          ],
        ),
      ],
    );
  }

  // Helper method to build a container for individual images
  Widget _buildImageContainer(String imageUrl) {
    return Container(
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
        imageUrl,
        height: 30,
        width: 30,
        fit: BoxFit.cover,
      ),
    );
  }
}
