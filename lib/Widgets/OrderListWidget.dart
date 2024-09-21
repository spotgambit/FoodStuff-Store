import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/BottomSheets/TrackOrderBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/CoinPillWidget.dart';
import 'package:groceryshop/Widgets/StarCoinWiget.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/ImageRepo.dart';
import '../Repo/RadiiRepo.dart';
import 'CustomDivider.dart';

class OrderListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> orders;
  final String status;
  final bool singleItem;

  const OrderListWidget({super.key, required this.orders, required this.status, required this.singleItem});

  @override
  State<OrderListWidget> createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.status == "all" || widget.singleItem ? const SizedBox() : Text(
            widget.status == "pending" ? "Current order" : widget.status == "completed" ? "Completed" : "Cancelled order",
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: ColorRepo.muted,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: widget.status == "all" || widget.singleItem ? 0 : 40,),
          SizedBox(
            width: screenWidth,
            child: ListView.builder(
              itemCount: widget.singleItem && widget.orders.isNotEmpty ? 1 : widget.orders.length,
              itemBuilder: (context, index) => _buildSummaryItem(widget.orders[index], index, screenWidth),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(Map<String, dynamic> order, int index, double screenWidth) {
    return order['status'] == widget.status ? GestureDetector(
      onTap: (){
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => Container(
              decoration: const BoxDecoration(
                color: ColorRepo.background, // Set your background color here
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: TrackOrderBottomSheetWidget(orderId: order['main-message'], subMessage: order['sub-message'], orderStatus: order['status'], orderDate: order['date'], orderTime: order['time'], orderPrice: order['price'])),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.83,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        widget.status == "pending" ? ImageRepo.bikeIcon : widget.status == "cancelled" ? ImageRepo.brokenEggShellIcon : ImageRepo.sealCheckSquare,
                        height: 36,
                        width: 36,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${order['main-label']} ",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: ColorRepo.dark,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.40,
                                child: Text(
                                  "${order['main-message']}",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: ColorRepo.muted,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(PhosphorIcons.clock, color: ColorRepo.dark, size: 16),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${order['time']}, ",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: ColorRepo.dark,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5),
                              widget.status == "completed" ? SizedBox(
                                width: screenWidth * 0.40,
                                child: Text(
                                    "${order['date']}",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: ColorRepo.muted,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    )
                                ),
                              ) : const SizedBox(),
                            ],
                          ),
                          const SizedBox(height: 10),
                          widget.status == "cancelled" ? const Text(
                            "Cancelled order",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorRepo.primaryDark,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ) : Row(
                            children: [
                              Text(
                                widget.status == "completed" ? "Order status: " : "${order['sub-label']} ",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: ColorRepo.muted,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.44,
                                child: Text(
                                  widget.status == "completed" ? "${order['status']}" : "${order['sub-message']}",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: ColorRepo.dark,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                PhosphorIcons.caret_right,
                color: ColorRepo.dark,
              ),
            ],
          ),
          SizedBox(height: widget.singleItem ? 0 : 10),
          widget.singleItem ? const SizedBox() : const CustomDivider(),
          SizedBox(height: widget.singleItem ? 0 : 10),
        ],
      ),
    ) : const SizedBox();
  }
}
