import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Repo/ColorRepo.dart';

class CartShimmerWidget extends StatelessWidget {
  const CartShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorRepo.mutedLite2,
      highlightColor: ColorRepo.muted,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 2,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 220,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 140,
                    width: 140,
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
                        height: 20,
                        width: 150,
                        decoration: BoxDecoration(
                          color: ColorRepo.mutedLite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 20,
                        width: 100,
                        decoration: BoxDecoration(
                          color: ColorRepo.mutedLite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 20,
                        width: 80,
                        decoration: BoxDecoration(
                          color: ColorRepo.mutedLite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 20,
                        width: 50,
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
