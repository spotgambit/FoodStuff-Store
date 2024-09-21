import 'dart:ui';
import 'package:flutter/material.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';

class SelectQuantityBottomSheetWidget extends StatefulWidget {
  final String previousScreen;
  final int quantity;
  final Function(int) onQuantitySelected;

  const SelectQuantityBottomSheetWidget({
    Key? key,
    this.previousScreen = "",
    this.quantity = 1,
    required this.onQuantitySelected,
  }) : super(key: key);

  @override
  State<SelectQuantityBottomSheetWidget> createState() =>
      _SelectQuantityBottomSheetWidgetState();
}

class _SelectQuantityBottomSheetWidgetState
    extends State<SelectQuantityBottomSheetWidget> {
  late int selectedQuantity;
  List<int> quantities = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void initState() {
    super.initState();
    selectedQuantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
      child: SizedBox(
        height: 300,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BottomSheetHandle(),
              const SizedBox(height: 20),
              Column(
                children: quantities.map((quantity) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedQuantity = quantity;
                      });
                      // Call the callback and pass the selected quantity
                      widget.onQuantitySelected(quantity);
                      // Close the bottom sheet
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: screenWidth,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: quantity == selectedQuantity
                            ? ColorRepo.muted2
                            : ColorRepo.transparent,
                        borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                      ),
                      child: Text(
                        "$quantity",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: ColorRepo.dark,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
