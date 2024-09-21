import 'package:flutter/material.dart';
import '../Repo/ColorRepo.dart';

class EmptyListWidget extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final String bodyText;
  final String linkText;
  final Function linkAction;

  const EmptyListWidget({super.key, required this.hintText, required this.icon, required this.bodyText, required this.linkAction, required this.linkText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_cart_outlined, size: 80, color: ColorRepo.muted),
          const SizedBox(height: 20),
          const Text(
            'Your cart is empty',
            style: TextStyle(
              color: ColorRepo.muted,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
