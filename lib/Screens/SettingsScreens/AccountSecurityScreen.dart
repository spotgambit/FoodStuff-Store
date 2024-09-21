import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Screens/SettingsScreens/ChangeEmailScreen.dart';
import 'package:groceryshop/Screens/SettingsScreens/ChangePhoneNumberScreen.dart';
import 'package:groceryshop/Widgets/BottomSheets/MembershipBottomSheetWidget.dart';
import '../../Repo/ColorRepo.dart';
import '../../Widgets/CustomDivider.dart';
import 'TwoStepVerificationSettingsScreen.dart';

class AccountSecurityScreen extends StatefulWidget {
  const AccountSecurityScreen({super.key});

  @override
  State<AccountSecurityScreen> createState() => _AccountSecurityScreenState();
}

class _AccountSecurityScreenState extends State<AccountSecurityScreen> {

  void _navigateTo(int screenIndex){
    switch(screenIndex){
      case 0:
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const MembershipBottomSheetWidget(),
        );
        break;

      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ChangePhoneNumberScreen()),
        );
        break;

      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ChangeEmailScreen()),
        );
        break;

      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const TwoStepVerificationSettingsScreen()),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _navigateTo(0),
            child: _buildSettingsRow(PhosphorIcons.crown, ScreenContext.linkText[0]),
          ),
          const SizedBox(height: 10),
          const CustomDivider(color: ColorRepo.mutedLite2),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _navigateTo(1),
            child: _buildSettingsRow(PhosphorIcons.device_mobile_camera, ScreenContext.linkText[1]),
          ),
          const SizedBox(height: 10),
          const CustomDivider(color: ColorRepo.mutedLite2),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _navigateTo(2),
            child: _buildSettingsRow(PhosphorIcons.envelope_simple, ScreenContext.linkText[2]),
          ),
          const SizedBox(height: 10),
          const CustomDivider(color: ColorRepo.mutedLite2),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _navigateTo(3),
            child: _buildSettingsRow(PhosphorIcons.shield_checkered_fill, ScreenContext.linkText[3]),
          ),
          const SizedBox(height: 10),
        ],),
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
  static String pageTitle = 'Account Security';

  static const List<String> linkText = [
    'Membership',
    'Change Phone Number',
    'Email Address',
    'Two-step verification',
  ];
}
