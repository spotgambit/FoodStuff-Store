import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/RadiiRepo.dart';
import 'BottomSheets/ChooseLocationBottomSheetWidget.dart';

class DeliveryInfo3 extends StatelessWidget {
  final String address;
  final double width;

  const DeliveryInfo3({
    Key? key,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: RadiiRepo.itemPaddingRight),
                  child: Icon(
                    PhosphorIcons.bicycle,
                    size: 16,
                    color: ColorRepo.dark,
                  ),
                ),
                Text(
                  "Deliver address",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorRepo.dark,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: RadiiRepo.itemPaddingRight),
                  child: Icon(
                    PhosphorIcons.map_pin_line,
                    size: 16,
                    color: ColorRepo.dark,
                  ),
                ),
                Text(
                  address,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorRepo.link,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
