import 'package:flutter/material.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/RadiiRepo.dart';

class CustomTextArea extends StatefulWidget {
  final String labelText;
  final String hintText;

  const CustomTextArea({super.key, required this.labelText, required this.hintText});

  @override
  _CustomTextAreaState createState() => _CustomTextAreaState();
}

class _CustomTextAreaState extends State<CustomTextArea> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            widget.labelText,
            style: const TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 16,
              color: ColorRepo.dark,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          height: 150,
          width: screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorRepo.muted2,
              width: 1.0,
            ),
          ),
          child: Focus(
            onFocusChange: (hasFocus) {
              setState(() {});
            },
            child: TextField(
              controller: _controller,
              maxLength: RadiiRepo.maxTextAreaCharacters,
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                counterText: '',
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
              style: const TextStyle(
                color: ColorRepo.dark,
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
          ),
        ),
        SizedBox(
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '${RadiiRepo.maxTextAreaCharacters - _controller.text.length} characters remaining',
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 11,
                color: ColorRepo.muted,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
