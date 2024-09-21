import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/Membership/MembershipOnboardingScreen.dart';
import 'package:groceryshop/Widgets/BottomSheets/AddPaymentMethodBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/BottomSheets/MembershipBottomSheetWidget.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ImageRepo.dart';
import '../BottomSheetHandle.dart';
import '../CustomDivider.dart';

class MembershipAgreementBottomSheetWidget extends StatefulWidget {
  const MembershipAgreementBottomSheetWidget({super.key});

  @override
  State<MembershipAgreementBottomSheetWidget> createState() => _MembershipAgreementBottomSheetWidgetState();
}

class _MembershipAgreementBottomSheetWidgetState extends State<MembershipAgreementBottomSheetWidget> {

  bool _isCheked = false;
  bool _userHasAValidPaymentMethod = false;

  String _cardNumber = "*****4567";

  _goBack(){
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,

      builder: (_) => const MembershipBottomSheetWidget(),
    );
  }

  _purchasePremiumPlan(){
    if(_isCheked){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const MembershipOnboardingScreen()),
      );
    }
  }
  
  _addPaymentMethod(){
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,

      builder: (_) => const AddPaymentMethodBottomSheetWidget(previousScreen: "MembershipAgreementBottomSheet"),
    );
  }

  _agreeToTerms(){
    setState(() {
      _isCheked = !_isCheked;
    });
  }

  double _premiumPrice = 999.00;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 760,
      width: screenWidth,
      padding: const EdgeInsets.all(RadiiRepo.screenPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiiRepo.bottomSheetBorderRadius),
        color: ColorRepo.background
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
                  onTap: (){
                    _goBack();
                  },
                  child: const Icon(
                    PhosphorIcons.arrow_left,
                    color: ColorRepo.dark,
                  ),
                ),
                const Text(
                  ScreenContext.appBarText,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: ColorRepo.dark,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Text(
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
              ],
            ),
            const SizedBox(height: 40),
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: ColorRepo.foreground,
                borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                border: Border.all(
                  color: ColorRepo.warning,
                  width: 0.5,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(ImageRepo.crownSimple, height: 32, width: 32),
                          const SizedBox(width: 10),
                          Text(
                            ScreenContext.headerText[0],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: ColorRepo.muted,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height:5),
                      const CustomDivider(),
                      const SizedBox(height:5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text(
                          ScreenContext.labelText[0],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                          Text(
                          "₦ $_premiumPrice / month",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ],)
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14,
                  color: ColorRepo.dark,
                ),
                children: [
                  TextSpan(
                    text: ScreenContext.bodyText[0],
                  ),
                  WidgetSpan(
                    child: Text(
                      "₦ $_premiumPrice",
                      style: const TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          color: ColorRepo.dark,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  TextSpan(
                    text: ScreenContext.bodyText[1],
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Text(
              ScreenContext.bodyText[2],
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 14,
                color: ColorRepo.dark,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Row(children: [
              GestureDetector(
                onTap: (){
                  _agreeToTerms();
                },
                child: Icon(
                  _isCheked ? PhosphorIcons.check_square : PhosphorIcons.square,
                  color: ColorRepo.dark,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                ScreenContext.labelText[1],
                style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorRepo.dark,
                ),
                textAlign: TextAlign.left,
              ),
            ],),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                _addPaymentMethod();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorRepo.foreground,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: ColorRepo.muted,
                    width: 0.5,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _userHasAValidPaymentMethod ? Image.asset(ImageRepo.visa) : const Icon(
                          PhosphorIcons.credit_card,
                          color: ColorRepo.dark,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _userHasAValidPaymentMethod ? "ending with $_cardNumber" : ScreenContext.labelText[2],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      PhosphorIcons.caret_right,
                      color: ColorRepo.dark,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: screenWidth,
              child: ElevatedButton(
                onPressed: _isCheked ? _purchasePremiumPlan : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isCheked ? ColorRepo.primary2 : ColorRepo.muted,
                  padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                  ),
                ),
                child: Text(
                  ScreenContext.buttonText[0],
                  style: TextStyle(
                    color: _isCheked ? ColorRepo.background : ColorRepo.dark,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],),
      )
      ,
    );
  }
}

class ScreenContext{
  static const String appBarText = "Upgrade to foodstuff premium";
  static const String exitText = "Cancel";
  static const List<String> headerText = ["Membership plan"];
  static const List<String> bodyText = ["By checking the box and clicking “Agree and purchase”, you authorise foodstuff Store to automatically charge your designated payment method ", " plus applicable taxes today and in advance for each monthly membership period and agree that your membership will continue until you timely cancel.", "To avoid being charged for another month of membership, you must cancel at least 48 hours before your membership, you must cancel at least 48 hours before your membership is set to renew in the “Foodstuff Store” section of your Account tab or by emailing us at hello@foodstuffstore.com. When you cancel, you will not receive a refund but can continue to use membership benefits unitl the end of the current membership period."];
  static const List<String> labelText = ["FoodstuffStore Premium", "I Agree and purchase", "Add payment method"];
  static const List<String> buttonText = ["Agree and purchase"];
}