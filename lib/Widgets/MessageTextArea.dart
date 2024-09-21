import 'package:flutter/material.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/ImageRepo.dart';
import '../Repo/RadiiRepo.dart';

class MessageTextArea extends StatefulWidget {
  final String hintText;

  const MessageTextArea({super.key, required this.hintText});

  @override
  _MessageTextAreaState createState() => _MessageTextAreaState();
}

class _MessageTextAreaState extends State<MessageTextArea> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth - 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 64,
            width: screenWidth * 0.72,
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
          GestureDetector(
              onTap: (){

              },
              child: Image.asset(ImageRepo.sendIcon))
        ],
      ),
    );
  }
}
