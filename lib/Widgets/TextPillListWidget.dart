import 'package:flutter/material.dart';
import 'package:groceryshop/Repo/ColorRepo.dart';
import '../Repo/ListRepo.dart';

class TextPillListWidget extends StatefulWidget {
  final double screenScrollLocation;
  final double widgetScrollLocation;

  const TextPillListWidget({
    Key? key,
    required this.screenScrollLocation,
    required this.widgetScrollLocation,
  }) : super(key: key);

  @override
  _TextPillListWidgetState createState() => _TextPillListWidgetState();
}

class _TextPillListWidgetState extends State<TextPillListWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.screenScrollLocation > 30 || widget.widgetScrollLocation > 50) {
      // Use ListView or Carousel here instead of Wrap
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            ListRepo.categories.length,
                (index) => _buildTextPill(ListRepo.categories[index], index),
          ),
        ),
      );
    } else {
      // Use Wrap for small scroll offsets
      return Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: List.generate(
          ListRepo.categories.length,
              (index) => _buildTextPill(ListRepo.categories[index], index),
        ),
      );
    }
  }

  Widget _buildTextPill(String category, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: widget.screenScrollLocation > 30 || widget.widgetScrollLocation > 50
            ? const EdgeInsets.only(right: 8.0)
            : const EdgeInsets.all(0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: isSelected ? ColorRepo.secondaryLite2 : ColorRepo.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? ColorRepo.secondaryLite : ColorRepo.muted,
              width: 1.0,
            ),
          ),
          child: Text(
            category,
            style: const TextStyle(
              color: ColorRepo.dark,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}