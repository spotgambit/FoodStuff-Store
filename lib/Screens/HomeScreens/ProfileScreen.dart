import 'package:flutter/material.dart';

import '../../Repo/ColorRepo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRepo.background,
      body: Container(
        color: ColorRepo.background,
      ),
    );
  }
}
