import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:groceryshop/Repo/ImageRepo.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Repo/ColorRepo.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({
    Key? key,
    required this.pageTitle,
    required this.pageUrl,
  }) : super(key: key);

  final String pageTitle;
  final String pageUrl;

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  bool isPageLoading = true;
  bool isValidUrl = false;
  bool isInternetConnected = false;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  void _checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isInternetConnected = connectivityResult != ConnectivityResult.none;
    });
  }

  void _validateUrl(String url) {
    if (url.contains("foodstuff.store")) {
      setState(() {
        isValidUrl = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: ColorRepo.primary2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorRepo.dark),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: !isInternetConnected
          ? SizedBox(
        height: screenHeight * 0.70,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageRepo.brokenEgg,
              width: screenWidth * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: screenWidth * 0.70,
                child: const Text(
                  "No internet connection",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorRepo.dark,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
          : Stack(
        children: [
          if (isValidUrl)
            WebView(
              initialUrl: widget.pageUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (String url) {
                if (kDebugMode) {
                  print('Page started loading: $url');
                }

                _validateUrl(url);

                setState(() {
                  isPageLoading = true;
                });
              },
              onPageFinished: (String url) {
                if (kDebugMode) {
                  print('Page finished loading: $url');
                }
                setState(() {
                  isPageLoading = false;
                });
              },
              onWebResourceError: (WebResourceError error) {
                if (kDebugMode) {
                  print('Web resource error: ${error.description}');
                }
                setState(() {
                  isPageLoading = false;
                });
              },
            ),
          if (isPageLoading || !isValidUrl)
            const Center(
              child: CircularProgressIndicator(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorRepo.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
