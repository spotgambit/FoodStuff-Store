import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Widgets/AddressListWidget.dart';
import '../../Widgets/BottomSheets/AddAddressBottomSheetWidget.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      appBar: AppBar(
        backgroundColor: ColorRepo.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(PhosphorIcons.caret_left, color: ColorRepo.dark),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RadiiRepo.screenPadding),
          child: SizedBox(
            height: screenHeight,
            child: const Column(
              children: [
                AddressListWidget(addresses: ListRepo.addresses),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        width: screenWidth,
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        color: ColorRepo.background,
        child: OutlinedButton(
          onPressed: (){
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => const AddAddressBottomSheetWidget(),
            );
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color:  ColorRepo.primary2),
            padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
            ),
          ),
          child: Text(
            ScreenContext.buttonText,
            style: const TextStyle(color: ColorRepo.dark, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static String pageTitle = 'Your addresses';
  static String buttonText = 'Add address';
}
