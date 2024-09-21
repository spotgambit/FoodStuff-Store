import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/RadiiRepo.dart';
import 'BottomSheets/ChooseLocationBottomSheetWidget.dart';

class DeliveryInfo2 extends StatelessWidget {
  final String address;
  final double width;

  const DeliveryInfo2({
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
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
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: RadiiRepo.itemPaddingRight),
            child: Icon(
              PhosphorIcons.caret_right,
              size: 24,
              color: ColorRepo.dark,
            ),
          ),
        ],
      ),
    );
  }
}
