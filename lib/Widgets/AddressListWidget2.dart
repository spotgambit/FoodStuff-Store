import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:groceryshop/Widgets/RadioButtonWidget.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/Enums/Shapes.dart';

class AddressListWidget2 extends StatefulWidget {
  final List<Map<String, dynamic>> addresses;

  const AddressListWidget2({Key? key, required this.addresses}) : super(key: key);

  @override
  _AddressListWidget2State createState() => _AddressListWidget2State();
}

class _AddressListWidget2State extends State<AddressListWidget2> {

  int selectedAddressByIndex = 0;

  _chooseAddress(int index){
    setState(() {
      selectedAddressByIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Separate the main address and non-main addresses
    final mainAddress = widget.addresses.firstWhere(
          (address) => address['is-main'],
      orElse: () => {},
    );
    final otherAddresses = widget.addresses.where((address) => !address['is-main']).toList();

    // Create a new list with the main address at the top
    final List<Map<String, dynamic>> orderedAddresses = [];
    if (mainAddress != null) {
      orderedAddresses.add(mainAddress);
    }
    orderedAddresses.addAll(otherAddresses);

    return SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 150),
          itemCount: orderedAddresses.length,
          itemBuilder: (context, index) {
            final address = orderedAddresses[index];
            return _buildAddressListItem(address, screenWidth);
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildAddressListItem(Map<String, dynamic> address, double screenWidth) {
    return GestureDetector(
      onTap: (){
        _chooseAddress(address["id"]);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                address["is-main"]
                    ? const Text(
                  "Default address",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorRepo.muted,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                )
                    : const SizedBox(),
                const SizedBox(height: 5),
                SizedBox(
                  width: screenWidth * 0.7,
                  child: Text(
                    address["name"],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: screenWidth * 0.7,
                  child: Text(
                    "${address["address"]}, ${address["state"]}, ${address["zip-code"]}, ${address["country-code"]}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: ColorRepo.muted,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            RadioButtonWidget(
                selected: selectedAddressByIndex == address["id"],
                baseColor: ColorRepo.transparent,
                unSelectedBgColor: ColorRepo.background,
                selectedBgColor: ColorRepo.dark,
                selectedBorderColor: ColorRepo.dark,
                unSelectedBorderColor: ColorRepo.dark,
                onTap: (){
                  _chooseAddress(address["id"]);
                },
                shape: Shapes.circle)
          ],
        ),
      ),
    );
  }
}
