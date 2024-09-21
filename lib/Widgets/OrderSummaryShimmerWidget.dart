import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Repo/ColorRepo.dart';

class OrderSummaryShimmerWidget extends StatelessWidget {
  const OrderSummaryShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorRepo.mutedLite2,
      highlightColor: ColorRepo.muted,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: ColorRepo.mutedLite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: 150,
                        decoration: BoxDecoration(
                          color: ColorRepo.mutedLite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 16,
                        width: 100,
                        decoration: BoxDecoration(
                          color: ColorRepo.mutedLite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 16,
                        width: 80,
                        decoration: BoxDecoration(
                          color: ColorRepo.mutedLite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
