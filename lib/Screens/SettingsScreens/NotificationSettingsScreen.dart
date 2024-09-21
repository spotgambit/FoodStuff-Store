import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {

  List<bool> notificationSettings = [true, true, false, false, true];

  void _toggleNotificstionSettings(int settingsIndex) {
    setState((){
      notificationSettings[settingsIndex] = !notificationSettings[settingsIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorRepo.background,
      appBar: AppBar(
        backgroundColor: ColorRepo.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(PhosphorIcons.arrow_left, color: ColorRepo.dark),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          ScreenContext.pageTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorRepo.dark,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.only(
              left: RadiiRepo.screenPadding,
              right: RadiiRepo.screenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ScreenContext.headerText[0],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 16,
                              color: ColorRepo.dark,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            ScreenContext.bodyText[0],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              color: ColorRepo.muted,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){_toggleNotificstionSettings(0);},
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return ScaleTransition(child: child, scale: animation);
                        },
                        child: Icon(
                          notificationSettings[0] ? PhosphorIcons.toggle_right_fill : PhosphorIcons.toggle_left,
                          color: notificationSettings[0] ? ColorRepo.success : ColorRepo.dark,
                          key: ValueKey<bool>(notificationSettings[0]),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ScreenContext.headerText[1],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 16,
                              color: ColorRepo.dark,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            ScreenContext.bodyText[1],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              color: ColorRepo.muted,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){_toggleNotificstionSettings(1);},
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return ScaleTransition(child: child, scale: animation);
                        },
                        child: Icon(
                          notificationSettings[1] ? PhosphorIcons.toggle_right_fill : PhosphorIcons.toggle_left,
                          color: notificationSettings[1] ? ColorRepo.success : ColorRepo.dark,
                          key: ValueKey<bool>(notificationSettings[1]),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ScreenContext.headerText[2],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 16,
                              color: ColorRepo.dark,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            ScreenContext.bodyText[2],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              color: ColorRepo.muted,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){_toggleNotificstionSettings(2);},
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return ScaleTransition(child: child, scale: animation);
                        },
                        child: Icon(
                          notificationSettings[2] ? PhosphorIcons.toggle_right_fill : PhosphorIcons.toggle_left,
                          color: notificationSettings[2] ? ColorRepo.success : ColorRepo.dark,
                          key: ValueKey<bool>(notificationSettings[2]),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ScreenContext.headerText[3],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 16,
                              color: ColorRepo.dark,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            ScreenContext.bodyText[3],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              color: ColorRepo.muted,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){_toggleNotificstionSettings(3);},
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return ScaleTransition(child: child, scale: animation);
                        },
                        child: Icon(
                          notificationSettings[3] ? PhosphorIcons.toggle_right_fill : PhosphorIcons.toggle_left,
                          color: notificationSettings[3] ? ColorRepo.success : ColorRepo.dark,
                          key: ValueKey<bool>(notificationSettings[3]),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ScreenContext.headerText[4],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 16,
                              color: ColorRepo.dark,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            ScreenContext.bodyText[4],
                            style: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              color: ColorRepo.muted,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){_toggleNotificstionSettings(4);},
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return ScaleTransition(child: child, scale: animation);
                        },
                        child: Icon(
                          notificationSettings[4] ? PhosphorIcons.toggle_right_fill : PhosphorIcons.toggle_left,
                          color: notificationSettings[4] ? ColorRepo.success : ColorRepo.dark,
                          key: ValueKey<bool>(notificationSettings[4]),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenContext {
  static String pageTitle = 'Notification Settings';
  static List<String> headerText = ['In-app notification', 'Push notifications', 'Email notifications', 'SMS notifications', 'Weekly Newsletters'];
  static List<String> bodyText = ['Get notifications within the foodstuff store app. Promotions & Referral programs and Toast notifications.', 'Get messages sent directly to your mobile device. Tracking orders,', 'Receive notifications alerts sent to your email. ', 'Receive notifications alerts sent to your phone number. ', 'Get tips, latest newsletters from us.'];
}
