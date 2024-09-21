import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Repo/ImageRepo.dart';
import 'package:groceryshop/Screens/AddressScreen/AddNewAddressScreen.dart';
import 'package:groceryshop/Utils/StringFormatterHelper.dart';
import 'package:groceryshop/Widgets/CustomDivider.dart';
import 'package:shimmer/shimmer.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';
import '../DotWidget.dart';
import '../OrderSummaryListWidget.dart';
import 'AddAddressBottomSheetWidget.dart';

class TrackOrderBottomSheetWidget extends StatefulWidget {
  final String orderId;
  final String orderStatus;
  final String orderDate;
  final String orderTime;
  final double orderPrice;
  final String subMessage;

  const TrackOrderBottomSheetWidget({
    super.key,
    required this.orderId,
    required this.orderStatus,
    required this.orderDate,
    required this.orderTime,
    required this.orderPrice,
    required this.subMessage,
  });

  @override
  State<TrackOrderBottomSheetWidget> createState() =>
      _TrackOrderBottomSheetWidgetState();
}

class _TrackOrderBottomSheetWidgetState
    extends State<TrackOrderBottomSheetWidget> {
  String username = "Boma";
  String address = "Kado Estate, FCT, Abuja";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(RadiiRepo.screenPadding),
      child: SizedBox(
        height: screenHeight * 0.85,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BottomSheetHandle(),
                  const SizedBox(height: 20),
                  _buildHeader(context),
                  const SizedBox(height: 20),
                  _buildOrderStatusImage(),
                  const SizedBox(height: 10),
                  _buildOrderIdRow(),
                  const SizedBox(height: 4),
                  _buildOrderTimeRow(),
                  const SizedBox(height: 20),
                  _buildOrderStatusContainer(screenWidth),
                  const SizedBox(height: 20),
                  _buildOrderSummary(),
                  const SizedBox(height: 20),
                  _buildOrderDetails(screenHeight),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            _buildBottomActionButton(context, screenWidth),
          ],
        ),
      ),
    );
  }

  // Header Row (AppBar)
  Row _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 45,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              ScreenContext.exitText,
              style: TextStyle(
                color: ColorRepo.dark,
                fontFamily: 'Urbanist',
                fontSize: 14,
              ),
            ),
          ),
        ),
        const Text(
          ScreenContext.appBarText,
          style: TextStyle(
            color: ColorRepo.dark,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 45),
      ],
    );
  }

  // Order Status Image
  Widget _buildOrderStatusImage() {
    return Image.asset(
      widget.orderStatus == "pending"
          ? ImageRepo.bikeIcon
          : widget.orderStatus == "cancelled"
          ? ImageRepo.brokenEggShellIcon
          : ImageRepo.sealCheckSquare,
    );
  }

  // Order ID Row
  Row _buildOrderIdRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ScreenContext.labelText[0],
          style: const TextStyle(
              color: ColorRepo.dark,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700),
        ),
        Text(
          widget.orderId,
          style: const TextStyle(
              color: ColorRepo.muted,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  // Order Time Row
  Row _buildOrderTimeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(PhosphorIcons.clock, color: ColorRepo.dark, size: 16),
        const SizedBox(width: 5),
        Text(
          widget.orderTime,
          style: const TextStyle(
            color: ColorRepo.dark,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          widget.orderDate,
          style: const TextStyle(
            color: ColorRepo.muted,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // Order Status Container
  Container _buildOrderStatusContainer(double screenWidth) {
    return Container(
      padding: const EdgeInsets.all(RadiiRepo.screenPadding),
      width: screenWidth,
      decoration: const BoxDecoration(
        color: ColorRepo.background,
        borderRadius: BorderRadius.all(Radius.circular(RadiiRepo.borderRadius)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ScreenContext.headerText[3],
            style: const TextStyle(
              color: ColorRepo.muted,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.orderStatus == "cancelled"
                ? ScreenContext.labelText[1]
                : widget.orderStatus == "pending"
                ? "${ScreenContext.labelText[2]} ${widget.subMessage}"
                : ScreenContext.labelText[3],
            style: TextStyle(
              color: widget.orderStatus == "cancelled"
                  ? ColorRepo.primaryDark
                  : widget.orderStatus == "pending"
                  ? ColorRepo.dark
                  : ColorRepo.successDark,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          _buildOrderProgress(screenWidth),
          const SizedBox(height: 20),
          _buildDeliveryLocation(),
        ],
      ),
    );
  }

  // Delivery Location Row
  Column _buildOrderProgress(double screenWidth) {
    return Column(children: [
      Stack(
        alignment: widget.orderStatus == "completed" ? Alignment.centerRight : Alignment.centerLeft,
        children: [
          Container(
            height: 12,
            padding: EdgeInsets.only(right: widget.orderStatus == "completed" ? 0 : widget.orderStatus == "pending" ? screenWidth * 0.22 : screenWidth * 0.77),
            decoration: BoxDecoration(
              color: ColorRepo.transparent,
              border: Border.all(
                color: ColorRepo.muted2,
                width: 0.8,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: widget.orderStatus == "completed" ? Container(
              height: 12,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(
                  colors: [ColorRepo.background, ColorRepo.success, ColorRepo.successDark],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ) : Shimmer.fromColors(
              baseColor: widget.orderStatus == "cancelled" ? ColorRepo.orangeLite3.withOpacity(0.3): ColorRepo.success.withOpacity(0.3),
              highlightColor: widget.orderStatus == "cancelled" ? ColorRepo.orangeLite3 : ColorRepo.success,
              child: Container(
                height: 12,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: widget.orderStatus == "cancelled" ? ColorRepo.orange : ColorRepo.success,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: widget.orderStatus == "cancelled" ? 8 : widget.orderStatus == "completed" ? 0 : screenWidth * 0.555),
              height: 24,
              child: DotWidget(size: 16, color: widget.orderStatus == "cancelled" ? ColorRepo.orangeLite3 : ColorRepo.success)),
          Container(
            height: 12,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                height: 6,
                width: 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorRepo.successDark,
                ),
              ),
                Container(
                  height: 6,
                  width: 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorRepo.successDark,
                  ),
                ),
                Container(
                  height: 6,
                  width: 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorRepo.successDark,
                  ),
                ),
                Container(
                  height: 6,
                  width: 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorRepo.successDark,
                  ),
                ),
            ],),
          )
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ScreenContext.progressText[0],
            style: const TextStyle(
              color: ColorRepo.muted,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
          Text(
            ScreenContext.progressText[1],
            style: const TextStyle(
              color: ColorRepo.muted,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
          Text(
            ScreenContext.progressText[2],
            style: const TextStyle(
              color: ColorRepo.muted,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
          Text(
            ScreenContext.progressText[3],
            style: const TextStyle(
              color: ColorRepo.muted,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
        ],
      ),
    ],);
  }

    Column _buildDeliveryLocation() {
      return Column(
        children: [
          Row(
            children: [
              const Icon(PhosphorIcons.map_pin, size: 16, color: ColorRepo.muted),
              const SizedBox(width: 8),
              Text(
                ScreenContext.labelText[4],
                style: const TextStyle(
                  color: ColorRepo.muted,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                username,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorRepo.muted,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: DotWidget(),
              ),
              Text(
                address,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorRepo.muted,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      );
    }

    // Order Summary
    Column _buildOrderSummary() {
      return Column(
        children: [
          Row(
            children: [
              Text(
                ScreenContext.headerText[2],
                style: const TextStyle(
                  color: ColorRepo.muted,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ScreenContext.headerText[1],
                style: const TextStyle(
                  color: ColorRepo.muted,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              Text(
                StringFormatHelper.formatBalance(widget.orderPrice),
                style: const TextStyle(
                  color: ColorRepo.dark,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const CustomDivider(),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ScreenContext.headerText[0],
                style: const TextStyle(
                  color: ColorRepo.muted,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              Text(
                '${ListRepo.products.length}',
                style: const TextStyle(
                  color: ColorRepo.dark,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      );
    }

    // Order Details List
    SizedBox _buildOrderDetails(double screenHeight) {
      return SizedBox(
        height: screenHeight * 0.5, // Limit height for the scrollable area
        child: const OrderSummaryListWidget(
          products: ListRepo.products,
        ),
      );
    }

    // Bottom Action Button fixed at bottom
    Align _buildBottomActionButton(BuildContext context, double screenWidth) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(10),
          color: ColorRepo.background,
          width: screenWidth,
          child: SizedBox(
            width: screenWidth * 0.42,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) =>
                  const AddAddressBottomSheetWidget(previousScreen: "ChooseLocationBottomSheet"),
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: widget.orderStatus == "pending"
                        ? ColorRepo.primary2
                        : ColorRepo.transparent),
                padding: const EdgeInsets.all(RadiiRepo.buttonPadding),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.orderStatus == "pending"
                      ? const SizedBox()
                      : const Icon(
                    PhosphorIcons.pencil_simple,
                    color: ColorRepo.dark,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    widget.orderStatus == "pending"
                        ? ScreenContext.buttonText[0]
                        : ScreenContext.buttonText[1],
                    style: const TextStyle(
                        color: ColorRepo.dark,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }


class ScreenContext {
  static const String exitText = "Cancel";
  static const String appBarText = "Track order";
  static const String bodyText =
      "Manage your delivery locations and delivery speed may vary for different locations.";
  static const List<String> buttonText = ["Cancel order", "Leave a review"];
  static const List<String> labelText = [
    "Order ID: ",
    "Order Cancelled",
    "Arriving in: ",
    "Order Completed",
    "Deliver to"
  ];
  static const List<String> progressText = [
    "order received",
    "shopping",
    "in-route",
    "delivered",
  ];
  static const List<String> headerText = ["Item(s)", "Total", "Details", "Out for delivery"];
}
