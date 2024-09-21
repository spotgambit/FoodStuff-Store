import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductGridShimmerWidget extends StatefulWidget {
  const ProductGridShimmerWidget({super.key});

  @override
  State<ProductGridShimmerWidget> createState() => _ProductGridShimmerWidgetState();
}

class _ProductGridShimmerWidgetState extends State<ProductGridShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: GridView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 3 / 4, // height is twice the width
          ),
          itemBuilder: (context, index) => _buildShimmerContainer(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildShimmerContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}