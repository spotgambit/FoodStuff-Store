import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Repo/RadiiRepo.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/ListRepo.dart';
import '../Screens/FavoriteScreens/FavoriteListScreen.dart';
import 'CustomDividerVertical.dart';

class ShoppingListHorizontalWidget extends StatefulWidget {
  final List<Map<String, dynamic>> listItems;

  const ShoppingListHorizontalWidget({super.key, required this.listItems});

  @override
  State<ShoppingListHorizontalWidget> createState() => _ShoppingListHorizontalWidgetState();
}

class _ShoppingListHorizontalWidgetState extends State<ShoppingListHorizontalWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: 60,
      width: screenWidth,
      child: ListView.builder(
        itemCount: widget.listItems.length > 2 ? 2 : widget.listItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _buildSummaryItem(widget.listItems[index], index, screenWidth, widget.listItems.length),
      ),
    );
  }

  Widget _buildSummaryItem(Map<String, dynamic> listItem, int index, double screenWidth, int itemCount) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FavoriteListScreen(listItems: ListRepo.products, pagetitle: listItem['name'])),
        );
      },
      child: SizedBox(
        height: 60,
        child: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildImageContainer(listItem['image1']),
                      _buildImageContainer(listItem['image2']),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildImageContainer(listItem['image3']),
                      _buildImageContainer(listItem['image4']),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listItem['name'].toString().length > 5 ? "${listItem['name'].toString().substring(0, 5)}..." : listItem['name'],
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
              ),
              const SizedBox(width: 10,),
              index == 1 ? Container(
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  color: ColorRepo.foreground,
                  borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                  border: Border.all(
                    color: ColorRepo.muted2,
                    width: 1.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    "+ ${itemCount - 2}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: ColorRepo.muted,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ) : const CustomDividerVertical(height: 40,),
              const SizedBox(width: 10,),
            ],
          ),
        ),
      ),
    );
  }

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
