import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'package:groceryshop/Widgets/CVVInputWidget.dart';
import 'package:groceryshop/Widgets/CreditcardInputWidget.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';
import 'MembershipAgreementBottomSheetWidget.dart';

class AddPaymentMethodBottomSheetWidget extends StatefulWidget {
  final String previousScreen = "";
  const AddPaymentMethodBottomSheetWidget({super.key, previousScreen});

  @override
  State<AddPaymentMethodBottomSheetWidget> createState() => _AddPaymentMethodBottomSheetWidgetState();
}

class _AddPaymentMethodBottomSheetWidgetState extends State<AddPaymentMethodBottomSheetWidget> {
  bool isCreditCardInputValid = false;
  bool isCreditCardExpiryDateValid = false;
  bool isCreditCardCVVValid = false;
  bool _isBtnEnabled = false;

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cardNumberController.addListener(_validateCardNumber);
    _expiryDateController.addListener(_validateExpiryDate);
    _cvvController.addListener(_validateCVV);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _validateCardNumber() {
    String cardNumber = _cardNumberController.text;
    String formattedNumber = StringFormatHelper.formatCardNumber(cardNumber);

    if (_cardNumberController.text != formattedNumber) {
      _cardNumberController.value = _cardNumberController.value.copyWith(
        text: formattedNumber,
        selection: TextSelection.collapsed(offset: formattedNumber.length),
      );
    }

    setState(() {
      isCreditCardInputValid = StringFormatHelper.isValidCreditCardNumber(formattedNumber);
      _enableBtn();
    });
  }

  void _validateExpiryDate() {
    String expiryDate = _expiryDateController.text;
    String formattedDate = StringFormatHelper.formatCreditCardExpiryDate(expiryDate);

    if (_expiryDateController.text != formattedDate) {
      _expiryDateController.value = _expiryDateController.value.copyWith(
        text: formattedDate,
        selection: TextSelection.collapsed(offset: formattedDate.length),
      );
    }

    setState(() {
      isCreditCardExpiryDateValid = StringFormatHelper.isValidCreditCardExpiryDate(formattedDate);
      _enableBtn();
    });
  }

  void _validateCVV() {
    String cvv = _cvvController.text;

    setState(() {
      isCreditCardCVVValid = StringFormatHelper.isValidCVV(cvv);
      _enableBtn();
    });
  }

  void _enableBtn() {
    setState(() {
      _isBtnEnabled = isCreditCardInputValid && isCreditCardExpiryDateValid && isCreditCardCVVValid;
    });
  }

  void _saveCard() {
    // Implement saving card logic here
  }

  void _goBack() {
    switch (widget.previousScreen) {
      case "MembershipAgreementBottomSheet":
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const MembershipAgreementBottomSheetWidget(),
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
    return Scaffold(
      body: Container(
        height: 760,
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
              CreditcardInputWidget(
                screenWidth: screenWidth,
                hintText: ScreenContext.placeHolderText[0],
                controller: _cardNumberController,
                isValid: isCreditCardInputValid,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      CreditcardInputWidget(
                        screenWidth: screenWidth * 0.42,
                        hintText: ScreenContext.placeHolderText[1],
                        controller: _expiryDateController,
                        isValid: isCreditCardExpiryDateValid,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      CVVInputWidget(
                        screenWidth: screenWidth * 0.42,
                        hintText: ScreenContext.placeHolderText[2],
                        controller: _cvvController,
                        isValid: isCreditCardCVVValid,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: ColorRepo.background,
        width: screenWidth,
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: ElevatedButton(
          onPressed: _isBtnEnabled ? _saveCard : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isBtnEnabled ? ColorRepo.primary2 : ColorRepo.muted,
            padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
            ),
          ),
          child: Text(
            ScreenContext.buttonText[0],
            style: TextStyle(
              color: _isBtnEnabled ? ColorRepo.background : ColorRepo.dark,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static const String appBarText = "Add payment method";
  static const String exitText = "Cancel";
  static const List<String> placeHolderText = ["0000 0000 0000 0000", "mm/yy", "123"];
  static const List<String> labelText = ["Card number", "Exp. date", "CVV"];
  static const List<String> buttonText = ["Save"];
}
