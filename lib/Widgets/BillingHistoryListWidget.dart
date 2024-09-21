import 'package:flutter/material.dart';
import '../Repo/ColorRepo.dart';

class BillingHistoryListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> billingHistory;

  const BillingHistoryListWidget({Key? key, required this.billingHistory}) : super(key: key);

  @override
  _BillingHistoryListWidgetState createState() => _BillingHistoryListWidgetState();
}

class _BillingHistoryListWidgetState extends State<BillingHistoryListWidget> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 150),
          itemCount: widget.billingHistory.length,
          itemBuilder: (context, index) {
            final bh = widget.billingHistory[index];
            return _buildBillingHistoryItem(bh, screenWidth);
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildBillingHistoryItem(Map<String, dynamic> billingHistory,
      double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Invoice number:",
                    style: TextStyle(
                      color: ColorRepo.muted,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    billingHistory['inv-num'],
                    style: const TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text(
                    "Date:",
                    style: TextStyle(
                      color: ColorRepo.muted,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    billingHistory['date'],
                    style: const TextStyle(
                      color: ColorRepo.dark,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "₦ ${billingHistory['price']}",
            style: const TextStyle(
              color: ColorRepo.dark,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}