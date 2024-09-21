import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../Repo/ColorRepo.dart';
import '../Utils/StringFormatterHelper.dart';

class CreateShoppingListInputWidget extends StatefulWidget {
  final double screenWidth;
  final String hintText;
  final TextEditingController controller;
  final bool isValid;
  final Function onSubmit;
  final Function onChange;

  const CreateShoppingListInputWidget({
    Key? key,
    required this.screenWidth,
    required this.hintText,
    required this.controller,
    required this.isValid,
    required this.onSubmit,
    required this.onChange,
  }) : super(key: key);

  @override
  _CreateShoppingListInputWidgetState createState() => _CreateShoppingListInputWidgetState();
}

class _CreateShoppingListInputWidgetState extends State<CreateShoppingListInputWidget> {

  bool isValid = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isValid = widget.isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: widget.screenWidth,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: ColorRepo.mutedLite,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.80, color: isValid ? ColorRepo.mutedLite2 : ColorRepo.secondary),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            PhosphorIcons.notepad,
            size: 24,
            color: ColorRepo.muted,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: widget.controller,
              maxLength: 15,
              decoration: InputDecoration(
                counterText: '',
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
              onSubmitted: (value) => widget.onSubmit(),
              onChanged: (value) => widget.onChange(),
            ),
          ),
        ],
      ),
    );
  }
}
