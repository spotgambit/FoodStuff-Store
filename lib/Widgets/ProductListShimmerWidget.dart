import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Repo/ColorRepo.dart';

class ProductListShimmerWidget extends StatelessWidget {
  const ProductListShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorRepo.mutedLite2,
      highlightColor: ColorRepo.muted,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: ColorRepo.mutedLite,
                      borderRadius: BorderRadius.circular(10),
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
