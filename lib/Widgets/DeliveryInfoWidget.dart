import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/RadiiRepo.dart';
import 'BottomSheets/AddAddressBottomSheetWidget.dart';
import 'BottomSheets/ChooseLocationBottomSheetWidget.dart';

class DeliveryInfo extends StatelessWidget {
  final String username;
  final String address;
  final double width;

  const DeliveryInfo({
    Key? key,
    required this.username,
    required this.address,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const ChooseLocationBottomSheetWidget(),
        );
      },
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: RadiiRepo.itemPaddingRight),
              child: Icon(
                PhosphorIcons.map_pin_line_fill,
                size: 24,
                color: ColorRepo.primary,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deliver to $username",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorRepo.dark,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: width < 1 ? null : width - 80,
                  child: Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: RadiiRepo.itemPaddingRight),
                          child: Text(
                            address,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Icon(
                          PhosphorIcons.caret_down,
                          size: 24,
                          color: ColorRepo.dark,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
