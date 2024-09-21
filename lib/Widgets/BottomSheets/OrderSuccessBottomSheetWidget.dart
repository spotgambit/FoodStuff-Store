import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../Repo/ImageRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomNavigationWidgetScreen.dart';
import '../BottomSheetHandle.dart';
class OrderSuccessBottomSheetWidget extends StatefulWidget {
  final String previousScreen;
  const OrderSuccessBottomSheetWidget({super.key, this.previousScreen = ""});

  @override
  State<OrderSuccessBottomSheetWidget> createState() => _OrderSuccessBottomSheetWidgetState();
}

class _OrderSuccessBottomSheetWidgetState extends State<OrderSuccessBottomSheetWidget> {

  void _trackOrder(){

  }

  void _returnToHome(){
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavigationWidgetScreen()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: SizedBox(
          height: 380,
          child: Column(
            children: [
              BottomSheetHandle(),
              const SizedBox(height: 20,),
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    ImageRepo.sealCheck,
                  )
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: screenWidth * 0.6,
                child: Text(
                  ScreenContext.bottomSheetText[0],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorRepo.dark,
                    fontFamily: 'MadeGentle',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                ScreenContext.bottomSheetText[1],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorRepo.dark,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth * 0.4,
                    child: ElevatedButton(
                      onPressed: _trackOrder,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: ColorRepo.transparent,
                        padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            PhosphorIcons.bicycle,
                            color: ColorRepo.dark,
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ScreenContext.btnText[0],
                            style: const TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),),
                  SizedBox(
                    width: screenWidth * 0.4,
                    child: ElevatedButton(
                      onPressed: _returnToHome,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorRepo.primary2,
                        padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                        ),
                      ),
                      child: Text(
                        ScreenContext.btnText[1],
                        style: const TextStyle(
                          color: ColorRepo.background,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static const List<String> btnText = [
    'Track order',
    'Done',
  ];

  static const List<String> bottomSheetText = [
    'Order placed successfully',
    'Sit back and relax as we get your foodstuffs, is on it’s way!',
  ];
}
