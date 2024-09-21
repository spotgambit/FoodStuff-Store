import 'package:flutter/material.dart';
import 'Screens/AuthScreens/SplashScreen.dart';
import 'Screens/SettingsScreens/SettingsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
