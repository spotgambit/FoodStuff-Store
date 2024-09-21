import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/CoinPillWidget.dart';
import '../Repo/ColorRepo.dart';
import '../Repo/ImageRepo.dart';
import 'CustomDivider.dart';

class NotificationListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> notifications;

  const NotificationListWidget({Key? key, required this.notifications}) : super(key: key);

  @override
  _NotificationListWidgetState createState() => _NotificationListWidgetState();
}

class _NotificationListWidgetState extends State<NotificationListWidget> {

  void _navigateToScreen(int screenIndex) {
    switch (screenIndex) {
      case 0:

        break;
    // Add more cases here for other screen navigations if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 150),
        itemCount: widget.notifications.length,
        itemBuilder: (context, index) {
          final notification = widget.notifications[index];
          return _buildNotificationItem(notification, screenWidth);
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification, double screenWidth) {
    final double textWidth = screenWidth * (notification['type'] == "membership" ? 0.9 : 0.7);
    final bool isMembership = notification['type'] == "membership";
    final bool isReferral = notification['type'] == "referral";
    final bool isOrder = notification['type'] == "order";

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: textWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                      _getNotificationIcon(notification['type']),
                      height: 36,
                      width: 36,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification['header'],
                          style: const TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildNotificationText(
                          label: notification['main-label'],
                          message: notification['main-message'],
                          screenWidth: screenWidth,
                          type: notification['type'],
                        ),
                        const SizedBox(height: 10),
                        _buildNotificationSubText(
                          label: notification['sub-label'],
                          message: notification['sub-message'],
                          screenWidth: screenWidth,
                          type: notification['type'],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!isMembership) ...[
              if (isReferral)
                const IconPillWidget(text: "+100")
              else if (isOrder)
                GestureDetector(
                  onTap: () => _navigateToScreen(0),
                  child: const Icon(
                    PhosphorIcons.caret_right,
                    color: ColorRepo.dark,
                  ),
                ),
            ]
          ],
        ),
        const SizedBox(height: 10),
        const CustomDivider(),
        const SizedBox(height: 10),
      ],
    );
  }

  String _getNotificationIcon(String type) {
    switch (type) {
      case "order":
        return ImageRepo.bikeIcon;
      case "membership":
        return ImageRepo.crownSimple;
      default:
        return ImageRepo.gift;
    }
  }

  Widget _buildNotificationText({
    required String label,
    required String message,
    required double screenWidth,
    required String type,
  }) {
    double widthFactor = type == "membership" ? 0.7 : type == "referral" ? 0.5 : 0.4;

    return Row(
      children: [
        Text(
          "$label ",
          style: const TextStyle(
            color: ColorRepo.dark,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        SizedBox(
          width: screenWidth * widthFactor,
          child: Text(
            message,
            style: const TextStyle(
              color: ColorRepo.muted,
              fontWeight: FontWeight.normal,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationSubText({
    required String label,
    required String message,
    required double screenWidth,
    required String type,
  }) {
    double widthFactor = type == "membership" ? 0.6 : type == "referral" ? 0.5 : 0.4;

    return Row(
      children: [
        Text(
          "$label ",
          style: const TextStyle(
            color: ColorRepo.muted,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
        ),
        Row(
          children: [
            if (type == "membership")
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.asset(
                  ImageRepo.visa,
                  height: 20,
                  width: 27,
                ),
              ),
            SizedBox(
              width: screenWidth * widthFactor,
              child: Text(
                message,
                style: const TextStyle(
                  color: ColorRepo.dark,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
