import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'package:groceryshop/Widgets/BottomSheets/ChooseLocationBottomSheetWidget.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';
import '../CustomDropdownWidget.dart';
import '../PhoneNumberInputWidget.dart';
import '../RegularInputWidget.dart';

class AddAddressBottomSheetWidget extends StatefulWidget {
  final String previousScreen = "";
  const AddAddressBottomSheetWidget({super.key, previousScreen});

  @override
  State<AddAddressBottomSheetWidget> createState() => _AddAddressBottomSheetWidgetState();
}

class _AddAddressBottomSheetWidgetState extends State<AddAddressBottomSheetWidget> {
  bool isFirstNameInputValid = false;
  bool isPhoneNumberInputValid = false;
  bool isStateValid = false;
  bool isAddressInputValid = false;
  bool _isBtnEnabled = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_validateFirstName);
    _phoneNumberController.addListener(_validatePhoneNumber);
    _addressController.addListener(_validateAddress);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _validatePhoneNumber() {
    final phoneNumber = _phoneNumberController.text;
    setState(() {
      isPhoneNumberInputValid = StringFormatHelper.isValidPhoneNumber(phoneNumber);
      _enableBtn();
    });
  }

  void _validateFirstName() {
    String name = _firstNameController.text;
    isFirstNameInputValid = name.isNotEmpty && !name.contains(' ') && name.length > 1;
    _enableBtn();
  }

  void _validateAddress() {
    String address = _addressController.text;
    isFirstNameInputValid = address.isNotEmpty && address.length > 2;
    _enableBtn();
  }

  void _enableBtn() {
    setState(() {
      _isBtnEnabled = isFirstNameInputValid && isPhoneNumberInputValid && isAddressInputValid;
    });
  }

  void _goBack() {
    switch (widget.previousScreen) {
      case "ChooseLocationBottomSheet":
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const ChooseLocationBottomSheetWidget(),
        );
        break;

      default:
        Navigator.pop(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 700,
      width: screenWidth,
      padding: const EdgeInsets.all(RadiiRepo.screenPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiiRepo.bottomSheetBorderRadius),
        color: ColorRepo.background,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomSheetHandle(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _goBack,
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
                const SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              ScreenContext.labelText[0],
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 16,
                color: ColorRepo.dark,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            RegularInputWidget(
              screenWidth: screenWidth,
              hintText: ScreenContext.placeHolderText[0],
              controller: _firstNameController,
              prefixIcon: const Icon(
                PhosphorIcons.user,
                size: 24,
              ),
              isValid: isFirstNameInputValid,
            ),
            const SizedBox(height: 20),
            Text(
              ScreenContext.labelText[1],
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 16,
                color: ColorRepo.dark,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            PhoneNumberInputWidget(
              screenWidth: screenWidth,
              hintText: ScreenContext.placeHolderText[1],
              controller: _phoneNumberController,
              isValid: isPhoneNumberInputValid,
            ),
            const SizedBox(height: 20),
            Text(
              ScreenContext.labelText[2],
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 16,
                color: ColorRepo.dark,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            CustomDropdownWidget(
              isValid: isStateValid,
              options: const ['Abuja', 'Lagos', 'Rivers State'],
              onChanged: (selected) {
                setState(() {
                  isStateValid = selected != null && selected.isNotEmpty;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              ScreenContext.labelText[3],
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 16,
                color: ColorRepo.dark,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            RegularInputWidget(
              screenWidth: screenWidth,
              hintText: ScreenContext.placeHolderText[3],
              controller: _addressController,
              prefixIcon: const Icon(
                PhosphorIcons.map_pin,
                size: 24,
              ),
              isValid: isAddressInputValid,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                color: ColorRepo.background,
                width: screenWidth,
                padding: const EdgeInsets.all(RadiiRepo.screenPadding),
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
                        PhosphorIcons.map_pin,
                        color: ColorRepo.dark,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        ScreenContext.linkText[0],
                        style: const TextStyle(color: ColorRepo.dark, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenContext {
  static const String appBarText = "Add new address";
  static const String exitText = "Cancel";
  static const List<String> placeHolderText = ["Enter your first name", "Enter your phone number", "Select state", "House no, Street, City, State and Zip code"];
  static const List<String> labelText = ["First name", "Phone number", "Current location", "Address / Pick up location"];
  static const List<String> linkText = ["Use current location"];
}
