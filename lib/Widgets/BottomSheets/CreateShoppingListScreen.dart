import 'package:flutter/material.dart';
import 'package:groceryshop/Screens/FavoriteScreens/FavoriteListScreen.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'dart:ui';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../BottomSheetHandle.dart';
import '../CreateShoppingListInputWidget.dart';

class CreateShoppingListBottomSheet extends StatefulWidget {
  const CreateShoppingListBottomSheet({super.key});

  @override
  State<CreateShoppingListBottomSheet> createState() => _CreateShoppingListBottomSheetState();
}

class _CreateShoppingListBottomSheetState extends State<CreateShoppingListBottomSheet> {

  bool _isBtnEnabled = false;
  final TextEditingController _textEditingController = TextEditingController();

  void _onChange(){
    setState(() {
      _isBtnEnabled = !StringFormatHelper.isNullOrEmpty(_textEditingController.text);
    });
  }

  void _createShoppingList(){
    if(!StringFormatHelper.isNullOrEmpty(_textEditingController.text)){
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => FavoriteListScreen(listItems: ListRepo.products, pagetitle: _textEditingController.text)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 500,
            width: screenWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RadiiRepo.bottomSheetBorderRadius),
                color: ColorRepo.background
            ),
            padding: const EdgeInsets.only(
              left: RadiiRepo.screenPadding,
              right: RadiiRepo.screenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomSheetHandle(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text(
                        ScreenContext.exitText,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: ColorRepo.dark,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      ScreenContext.pageTitle,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: ColorRepo.dark,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  ScreenContext.bodyText,
                  style: const TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 11,
                    color: ColorRepo.muted,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 40),
                Text(
                  ScreenContext.labelText,
                  style: const TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 16,
                    color: ColorRepo.muted,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                CreateShoppingListInputWidget(
                  screenWidth: screenWidth,
                  hintText: ScreenContext.inputPlaceholders,
                  controller: _textEditingController,
                  isValid: _isBtnEnabled,
                  onSubmit: _createShoppingList,
                  onChange: _onChange,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              height: RadiiRepo.bottomSheetLiteHeight,
              color: ColorRepo.background,
              child: Padding(
                padding: const EdgeInsets.all(RadiiRepo.screenPadding),
                child: Column(
                  children: [
                    SizedBox(
                      width: screenWidth - 30,
                      child: ElevatedButton(
                        onPressed: _createShoppingList,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isBtnEnabled ? ColorRepo.primary2 : ColorRepo.muted2,
                          padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                          ),
                        ),
                        child: Text(
                          ScreenContext.btnText,
                          style: TextStyle(
                            color: _isBtnEnabled ? ColorRepo.background : ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ScreenContext {
  static String pageTitle = 'Create Shopping List';
  static String bodyText = 'Give your shopping list a title';
  static String labelText = 'Title / Name';
  static String exitText = 'Cancel';
  static String inputPlaceholders = 'Typing...';
  static String btnText = 'Create list';
}
