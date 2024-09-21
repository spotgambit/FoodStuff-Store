import 'package:flutter/material.dart';
import 'package:groceryshop/Widgets/DefaultAvatarWidget.dart';

import '../Repo/ColorRepo.dart';
import 'CircleAvatarWidget.dart';
import 'RateProductWidget.dart';

class ReviewListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> reviews;

  const ReviewListWidget({super.key, required this.reviews});

  @override
  State<ReviewListWidget> createState() => _ReviewListWidgetState();
}

class _ReviewListWidgetState extends State<ReviewListWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 40),
        itemCount: widget.reviews.length,
        itemBuilder: (context, index) => _buildCartItem(widget.reviews[index], index, screenWidth),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> reviews, int index, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  reviews['image'] == 'default' ?  const DefaultAvatarWidget(
                      avaterSize: 30,
                      height: 44,
                      width: 44) : CircleAvatarWidget(
                      username: reviews['name'],
                      imageUrl: reviews['image'],
                      height: 44,
                      width: 44
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reviews['name'],
                        style: const TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 18,
                          color: ColorRepo.dark,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: const RateProductWidget(size: 15, spacing: 5, fontSize: 14, editable: false),
                      )
                    ],),
                ],),
                Text(
                  reviews['date'],
                  style: const TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 11,
                    color: ColorRepo.muted2,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              reviews['comment'],
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 16,
                color: ColorRepo.muted2,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
