import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/SearchInputWidget.dart';

import '../Repo/ColorRepo.dart';

class CustomSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  final Function onSearch;
  final Function onChange;

  CustomSearchAppBar({required this.searchController, required this.onSearch, required this.onChange});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: AppBar(
        leading: IconButton(
          icon: const Icon(PhosphorIcons.arrow_left, color: ColorRepo.dark),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SearchInputWidget(
          screenWidth: screenWidth,
          hintText: 'Food stuffs, groceries and more',
          controller: searchController,
          isValid: true,
          onSearch: onSearch,
          onChange: onChange,
        ),
        backgroundColor: ColorRepo.background,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
