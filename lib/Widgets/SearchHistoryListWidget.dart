import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/BottomSheets/ShoppingListOptionMenuBottomSheetWidget.dart';
import '../Repo/ColorRepo.dart';
import '../Utils/StringFormatterHelper.dart';
import 'CustomDivider.dart';

class SearchHistoryListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> history;
  final Function action;

  const SearchHistoryListWidget({super.key, required this.history, required this.action});

  @override
  State<SearchHistoryListWidget> createState() => _SearchHistoryListWidgetState();
}

class _SearchHistoryListWidgetState extends State<SearchHistoryListWidget> {


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
          itemCount: widget.history.length,
          itemBuilder: (context, index) => _buildSummaryItem(widget.history[index], index, screenWidth),
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
                  child: Text(
                    product['keyword'],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
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
