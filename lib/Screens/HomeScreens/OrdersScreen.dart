import 'package:flutter/material.dart';

import '../../Repo/ColorRepo.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
