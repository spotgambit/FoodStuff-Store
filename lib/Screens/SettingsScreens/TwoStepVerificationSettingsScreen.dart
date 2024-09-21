import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../Repo/ColorRepo.dart';
import '../../Repo/RadiiRepo.dart';

class TwoStepVerificationSettingsScreen extends StatefulWidget {
  const TwoStepVerificationSettingsScreen({super.key});

  @override
  State<TwoStepVerificationSettingsScreen> createState() => _TwoStepVerificationSettingsScreenState();
}

class _TwoStepVerificationSettingsScreenState extends State<TwoStepVerificationSettingsScreen> {
  bool _useTFA = false;
  bool _hasPinBeenChangedBefore = false;

  void _toggleTFA() {
    setState(() {
      _useTFA = !_useTFA;
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
                Text(
                  ScreenContext.bodyText,
                  style: const TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 14,
                    color: ColorRepo.muted,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _useTFA ? ScreenContext.labelText[1] : ScreenContext.labelText[0],
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        color: _useTFA ? ColorRepo.danger : ColorRepo.dark,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    GestureDetector(
                      onTap: _toggleTFA,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return ScaleTransition(child: child, scale: animation);
                        },
                        child: Icon(
                          _useTFA ? PhosphorIcons.toggle_right_fill : PhosphorIcons.toggle_left,
                          color: _useTFA ? ColorRepo.success : ColorRepo.dark,
                          key: ValueKey<bool>(_useTFA),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _hasPinBeenChangedBefore ? ScreenContext.linkText[1] : ScreenContext.linkText[0],
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        color: _hasPinBeenChangedBefore ? ColorRepo.dark : ColorRepo.muted,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Icon(PhosphorIcons.caret_right, color: _hasPinBeenChangedBefore ? ColorRepo.dark : ColorRepo.muted2),
                  ],
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
  static String pageTitle = 'Two-step authentication';
  static String bodyText = 'You’ll need to enter your PIN to add a layer of authentication. Confirm orders with PIN.';
  static List<String> labelText = ['Turn on', 'Turn off'];
  static List<String> linkText = ['Set PIN', 'Change PIN'];
}
