import 'package:flutter/material.dart';
import 'package:groceryshop/Repo/ColorRepo.dart';
import 'package:groceryshop/Widgets/BottomSheets/SelectQuantityBottomSheetWidget.dart';

class QuantityInputWidget extends StatefulWidget {
  final TextEditingController quantityController;

  QuantityInputWidget({
    super.key,
    required this.quantityController,
  });

  @override
  _QuantityInputWidgetState createState() => _QuantityInputWidgetState();
}

class _QuantityInputWidgetState extends State<QuantityInputWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => SelectQuantityBottomSheetWidget(
            quantity: int.parse(widget.quantityController.text),
            onQuantitySelected: (newQuantity) {
              setState(() {
                widget.quantityController.text = newQuantity.toString();
              });
            },
          ),
        );
      },
      child: Container(
        height: 35,
        width: 35,
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: ColorRepo.foreground,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.80, color: Color(0xFF919191)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            "${widget.quantityController.text}",
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: ColorRepo.dark,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
