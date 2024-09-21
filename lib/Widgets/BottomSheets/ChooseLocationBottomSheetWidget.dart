import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../../Screens/AddressScreen/AddressScreen.dart';
import '../AddressListWidget2.dart';
import '../BottomSheetHandle.dart';
import 'AddAddressBottomSheetWidget.dart';

class ChooseLocationBottomSheetWidget extends StatefulWidget {
  final String previousScreen;
  const ChooseLocationBottomSheetWidget({super.key, this.previousScreen = ""});

  @override
  State<ChooseLocationBottomSheetWidget> createState() => _ChooseLocationBottomSheetWidgetState();
}

class _ChooseLocationBottomSheetWidgetState extends State<ChooseLocationBottomSheetWidget> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(RadiiRepo.screenPadding),
        child: SizedBox(
          height: 600,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BottomSheetHandle(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
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
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    ScreenContext.bodyText,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const SizedBox(
                      height: 400,
                      child: AddressListWidget2(addresses: ListRepo.addresses)),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: screenWidth,
                  child: Row(children: [
                    SizedBox(
                      width: screenWidth * 0.42,
                      child: OutlinedButton(
                        onPressed: (){
                          Navigator.pop(context);
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (_) => const AddAddressBottomSheetWidget(previousScreen: "ChooseLocationBottomSheet",),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color:  ColorRepo.dark),
                          padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              PhosphorIcons.plus_circle,
                              color: ColorRepo.dark,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              ScreenContext.buttonText[0],
                              style: const TextStyle(color: ColorRepo.dark, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: screenWidth * 0.42,
                      child: OutlinedButton(
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const AddressScreen()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color:  ColorRepo.dark),
                          padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              PhosphorIcons.address_book,
                              color: ColorRepo.dark,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              ScreenContext.buttonText[1],
                              style: const TextStyle(color: ColorRepo.dark, fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static const String exitText = "Cancel";
  static const String appBarText = "Choose your location";
  static const String bodyText = "Manage your delivery locations and delivery speed may vary for different locations.";
  static const List<String> buttonText = ["Add address", "Address book"];
}
