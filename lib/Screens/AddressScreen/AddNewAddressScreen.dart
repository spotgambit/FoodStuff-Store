import 'package:flutter/material.dart';
import 'dart:ui';
import '../../Repo/ColorRepo.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      appBar: AppBar(
        backgroundColor: ColorRepo.background,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 20.0),
          child: GestureDetector(
            onTap: () {
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
        ),
        title: Text(
          ScreenContext.pageTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorRepo.dark,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const SizedBox()
    );
  }
}

class ScreenContext {
  static String pageTitle = 'Write a review';
  static String exitText = 'Cancel';
}
