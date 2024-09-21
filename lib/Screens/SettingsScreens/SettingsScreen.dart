import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/SettingsScreens/AccountSecurityScreen.dart';
import 'package:groceryshop/Screens/SettingsScreens/NotificationSettingsScreen.dart';
import 'package:groceryshop/Widgets/BottomSheets/DeleteAccountBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/BottomSheets/LogOutBottomSheetWidget.dart';
import 'package:groceryshop/Widgets/BottomSheets/PasswordUpdatedBottomSheetWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Widgets/CustomDivider.dart';
import '../../Widgets/UserAvatarWidget.dart';
import '../../Widgets/WebViewWidget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  String fullName = "Boma Dokubo";
  String email = "bomadokubo@gmail.com";
  String profilePicture = "https://example.com/user_avatar.png";

  void _navigateTo(int screenIndex){
    switch(screenIndex){
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AccountSecurityScreen()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const NotificationSettingsScreen()),
        );
        break;
      case 2:
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) {
                  return WebViewWidget(pageTitle: "Privacy Policy", pageUrl: ListRepo.companyInfo[0]['Website']);
                })).then((value){
          //Write code that'll be executed when user closes the in-app webview or in-app browser here.
        });
        break;
      case 3:
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) {
                  return WebViewWidget(pageTitle: "Terms and Conditions", pageUrl: ListRepo.companyInfo[0]['Website']);
                })).then((value){
          //Write code that'll be executed when user closes the in-app webview or in-app browser here.
        });
        break;
      case 4:
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) {
                  return WebViewWidget(pageTitle: "About", pageUrl: ListRepo.companyInfo[0]['Website']);
                })).then((value){
          //Write code that'll be executed when user closes the in-app webview or in-app browser here.
        });
        break;
      case 5:
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const DeleteAccountBottomSheetWidget(),
        );
        break;
      case 6:
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const LogOutBottomSheetWidget(),
        );
        break;
    }
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              const SizedBox(height: 10),
              Row(children: [
                UserAvatarWidget(
                  imageUrl: profilePicture,
                  fullName: fullName,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 21,
                        color: ColorRepo.dark,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      email,
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: ColorRepo.muted,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              ],),
              const SizedBox(height: 10),
              const CustomDivider(thickness: 1.5),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () => _navigateTo(0),
                child: _buildSettingsRow(PhosphorIcons.key, ScreenContext.linkText[0]),
              ),
              const SizedBox(height: 10),
              const CustomDivider(color: ColorRepo.mutedLite2),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _navigateTo(1),
                child: _buildSettingsRow(PhosphorIcons.notification, ScreenContext.linkText[1]),
              ),
              const SizedBox(height: 10),
              const CustomDivider(color: ColorRepo.mutedLite2),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _navigateTo(2),
                child: _buildSettingsRow(PhosphorIcons.lock_laminated, ScreenContext.linkText[2]),
              ),
              const SizedBox(height: 10),
              const CustomDivider(color: ColorRepo.mutedLite2),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _navigateTo(3),
                child: _buildSettingsRow(PhosphorIcons.newspaper, ScreenContext.linkText[3]),
              ),
              const SizedBox(height: 10),
              const CustomDivider(color: ColorRepo.mutedLite2),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _navigateTo(4),
                child: _buildSettingsRow(PhosphorIcons.info, ScreenContext.linkText[4]),
              ),
              const SizedBox(height: 10),
              const CustomDivider(color: ColorRepo.mutedLite2),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _navigateTo(5),
                child: _buildSettingsRow(PhosphorIcons.smiley_x_eyes, ScreenContext.linkText[5]),
              ),
              const SizedBox(height: 10),
              const CustomDivider(color: ColorRepo.mutedLite2),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _navigateTo(6),
                child: _buildSettingsRow(PhosphorIcons.sign_out, ScreenContext.linkText[6]),
              ),
              const SizedBox(height: 10),
            ],),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Version ${ListRepo.companyInfo[0]['AppVersion']}",
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 11,
                      color: ColorRepo.dark,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "© 2024 ${ListRepo.companyInfo[0]['AppName'].toString().toLowerCase()}",
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 8,
                      color: ColorRepo.muted,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsRow(IconData iconData, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Icon(iconData, color: ColorRepo.primary2),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 16,
              color: ColorRepo.dark,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],),
        const Icon(PhosphorIcons.caret_right, color: ColorRepo.dark),
      ],
    );
  }
}

class ScreenContext {
  static String pageTitle = 'Settings';

  static const List<String> linkText = [
    'Account security',
    'Notification',
    'Privacy policy',
    'Terms and conditions',
    'About us',
    'Delete my account',
    'Log out',
  ];
}
