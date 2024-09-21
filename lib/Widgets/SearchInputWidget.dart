import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../Repo/ColorRepo.dart';

class SearchInputWidget extends StatefulWidget {
  final double screenWidth;
  final String hintText;
  final TextEditingController controller;
  final bool isValid;
  final Function onSearch;
  final Function onChange;

  const SearchInputWidget({
    Key? key,
    required this.screenWidth,
    required this.hintText,
    required this.controller,
    required this.isValid,
    required this.onSearch,
    required this.onChange
  }) : super(key: key);

  @override
  _SearchInputWidgetState createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: widget.screenWidth,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: ColorRepo.mutedLite,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.80, color: widget.isValid ? ColorRepo.mutedLite2 : ColorRepo.secondary),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => widget.onSearch(),
            child: const Icon(
              PhosphorIcons.magnifying_glass,
              size: 24,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF919191),
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                ),
              ),
              keyboardType: TextInputType.text,
              style: const TextStyle(
                color: Color(0xFF303030),
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w400,
              ),
              onSubmitted: (value) => widget.onSearch(),
              onChanged: (value) => widget.onChange(),
            ),
          ),
        ],
      ),
    );
  }
}
