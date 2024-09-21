import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/BottomSheets/MembershipAgreementBottomSheetWidget.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ImageRepo.dart';
import '../BottomSheetHandle.dart';

class MembershipBottomSheetWidget extends StatefulWidget {
  const MembershipBottomSheetWidget({super.key});

  @override
  State<MembershipBottomSheetWidget> createState() => _MembershipBottomSheetWidgetState();
}

class _MembershipBottomSheetWidgetState extends State<MembershipBottomSheetWidget> {

  _upgradeToPremium(){
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const MembershipAgreementBottomSheetWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 740,
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiiRepo.bottomSheetBorderRadius)
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomSheetHandle(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: RadiiRepo.screenPadding),
              child: GestureDetector(
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
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: RadiiRepo.screenPadding),
              child: Row(children: [
                Image.asset(ImageRepo.coffeeBeanIconGradientBg),
                const SizedBox(width: 10),
                Image.asset(ImageRepo.carrotIconGradientBg),
                const SizedBox(height: 10),
                Image.asset(ImageRepo.cherryIconGradientBg),
                const SizedBox(height: 10),
                Image.asset(ImageRepo.cowIconGradientBg),
              ],),
            ),
            const SizedBox(height: 20),
            Container(
              width: screenWidth,
              height: 620,
              color: ColorRepo.background2,
              padding: const EdgeInsets.all(RadiiRepo.screenPadding),
              child: Column(children: [
                Text(
                  ScreenContext.headerText[0],
                  style: const TextStyle(
                      fontFamily: 'MadeGentle',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: ColorRepo.dark
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                Text(
                  ScreenContext.bodyText[0],
                  style: const TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 14,
                    color: ColorRepo.dark,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Image.asset(ImageRepo.starIconGradientBg),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: screenWidth * 0.76,
                    child: Text(
                      ScreenContext.bodyText[1],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.dark,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Image.asset(ImageRepo.giftIconGradientBg),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: screenWidth * 0.76,
                    child: Text(
                      ScreenContext.bodyText[2],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.dark,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Image.asset(ImageRepo.stakeIconGradientBg),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: screenWidth * 0.76,
                    child: Text(
                      ScreenContext.bodyText[3],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.dark,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Image.asset(ImageRepo.basketIconGradientBg),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: screenWidth * 0.76,
                    child: Text(
                      ScreenContext.bodyText[4],
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.dark,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],),
                const SizedBox(height: 40),
                SizedBox(
                  width: screenWidth,
                  child: ElevatedButton(
                    onPressed: _upgradeToPremium,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorRepo.primary2,
                      padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ScreenContext.buttonText[0],
                          style: const TextStyle(
                            color: ColorRepo.background,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          PhosphorIcons.crown_simple,
                          size: 30  ,
                          color: ColorRepo.background,
                        ),
                      ],
                    ),
                  ),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenContext{
  static const double _premiumPrice = 999.00;
  static const String exitText = "Cancel";
  static const List<String> headerText = ["Foodstuff Shopping a notch up"];
  static const List<String> bodyText = ["upgrade for ₦ $_premiumPrice / month to unlock an even more shopping experience with more shopping points. Go premium today!", "Get shopping points as you shop. shop and get reward.", "Discover unique benefits such as discounted payments for partnered restaurants and hotels near you.", "Get first picked freshly farmed products as a premium member as your order items.", "Become a part of a leading community that supports small business / farmer owners today."];
  static const List<String> buttonText = ["Upgrade to foodstuff Premium"];
}