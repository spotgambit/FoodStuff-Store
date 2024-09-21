import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';

class PillShimmerWidget extends StatelessWidget {
  final double screenScrollLocation;
  final double widgetScrollLocation;

  const PillShimmerWidget({super.key, required this.screenScrollLocation, required this.widgetScrollLocation});

  @override
  Widget build(BuildContext context) {
    if (screenScrollLocation > 30 || widgetScrollLocation > 50) {
      // Use ListView or Carousel here instead of Wrap
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              ShimmerContext.headers.length,
                  (index) => _buildShimmerPill(ShimmerContext.headers[index]),
            ),
          ),
        ),
      );
    } else {
      // Use Wrap for small scroll offsets
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(
            ShimmerContext.headers.length,
                (index) => _buildShimmerPill(ShimmerContext.headers[index]),
          ),
        ),
      );
    }
  }

  Widget _buildShimmerPill(double width) {
    return Padding(
      padding: screenScrollLocation > 30 || widgetScrollLocation > 50 ? const EdgeInsets.only(right: 8.0) : const EdgeInsets.all(0),
      child: Container(
        height: 30,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class ShimmerContext {
  static const List<double> headers = [
    50, 120, 100, 100, 90, 90, 70, 100
  ];
}
