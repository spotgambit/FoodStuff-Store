import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/CustomDivider.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/RadiiRepo.dart';

class AddressListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> addresses;

  const AddressListWidget({Key? key, required this.addresses}) : super(key: key);

  @override
  _AddressListWidgetState createState() => _AddressListWidgetState();
}

class _AddressListWidgetState extends State<AddressListWidget> {
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
    return Column(
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
        Text(
          address["name"],
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: ColorRepo.dark,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "${address["address"]}, ${address["state"]}, ${address["zip-code"]}, ${address["country-code"]}",
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: ColorRepo.dark,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: ColorRepo.muted2),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(PhosphorIcons.pencil_simple_line, color: ColorRepo.dark, size: 16),
                  SizedBox(width: 5),
                  Text(
                    "Edit",
                    style: TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: address["is-main"] ? 10 : 0),
            address["is-main"]
                ? OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: ColorRepo.muted2),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(PhosphorIcons.star, color: ColorRepo.dark, size: 16),
                  SizedBox(width: 5),
                  Text(
                    "Set as default",
                    style: TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
                : const SizedBox(),
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: ColorRepo.muted2),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(PhosphorIcons.trash, color: ColorRepo.dark, size: 16),
                  SizedBox(width: 5),
                  Text(
                    "Remove",
                    style: TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const CustomDivider(),
        const SizedBox(height: 10),
      ],
    );
  }
}
