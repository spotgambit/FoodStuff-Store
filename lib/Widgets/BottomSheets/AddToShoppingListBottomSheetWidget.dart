import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../Repo/Enums/Shapes.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../../Screens/AddressScreen/AddressScreen.dart';
import '../AddressListWidget2.dart';
import '../BottomSheetHandle.dart';
import '../CustomDivider.dart';
import '../RadioButtonWidget.dart';
import '../SelectShoppingListWidget.dart';
import '../ShoppingListWidget.dart';
import '../SquareGradientIcon.dart';
import 'AddAddressBottomSheetWidget.dart';

class AddToShoppingListBottomSheetWidget extends StatefulWidget {
  const AddToShoppingListBottomSheetWidget({super.key});

  @override
  State<AddToShoppingListBottomSheetWidget> createState() => _AddToShoppingListBottomSheetWidgetState();
}

class _AddToShoppingListBottomSheetWidgetState extends State<AddToShoppingListBottomSheetWidget> {

  List<int> selectedOptions = [0];
  int totalLikedItems = 0;

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
      child: Padding(
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: SizedBox(
          height: 600,
          child: Stack(
            children: [
              Column(
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
                        child: const Text(
                          ScreenContext.exitText,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Text(
                        ScreenContext.appBarText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
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
                  const SizedBox(height: 20),
                  const Text(
                    ScreenContext.bodyText,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(
                      children: [
                        const SquareGradientIcon(icon: Icon(
                            PhosphorIcons.heart_fill,
                            color: ColorRepo.background,
                            size: 20), height: 44, width: 44),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ScreenContext.labelText[0],
                              style: const TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 16,
                                color: ColorRepo.dark,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(
                                  PhosphorIcons.push_pin_fill,
                                  color: ColorRepo.dark,
                                  size: 14,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '$totalLikedItems ${ScreenContext.labelText[1]}',
                                  style: const TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 11,
                                    color: ColorRepo.muted,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    RadioButtonWidget(
                        selected: selectedOptions[0] == 1,
                        baseColor: ColorRepo.transparent,
                        unSelectedBgColor: ColorRepo.background,
                        selectedBgColor: ColorRepo.dark,
                        selectedBorderColor: ColorRepo.dark,
                        unSelectedBorderColor: ColorRepo.dark,
                        onTap: (){
                          setState(() {
                            selectedOptions[0] = selectedOptions[0] == 0 ? 1 : 0;
                          });
                        },
                        shape: Shapes.circle)
                  ],),
                  const SizedBox(height: 20),
                  const CustomDivider(),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: screenHeight * 0.40,
                    child: SingleChildScrollView(
                      child: const SelectShoppingListWidget(
                          listItems: ListRepo.shoppingLists
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: screenWidth,
                  child: Row(children: [
                    SizedBox(
                      width: screenWidth * 0.42,
                      child: OutlinedButton(
                        onPressed: (){

                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color:  ColorRepo.transparent),
                          padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              PhosphorIcons.plus_circle,
                              color: ColorRepo.dark,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              ScreenContext.buttonText[0],
                              style: const TextStyle(color: ColorRepo.dark, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: screenWidth * 0.42,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorRepo.primary2,
                          padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                          ),
                        ),
                        child: Text(
                          ScreenContext.buttonText[1],
                          style: const TextStyle(
                            color: ColorRepo.background,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static const String exitText = "Cancel";
  static const String appBarText = "Add to Shopping List";
  static const String bodyText = "Liked items are added to your shopping list and order on the go the entire list.";
  static const List<String> buttonText = ["New List", "Done"];
  static const List<String> labelText = ["Liked Items", "items"];
}
