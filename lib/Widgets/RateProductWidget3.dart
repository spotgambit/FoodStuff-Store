import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';
import 'LoadingBarWidget.dart';

class RateProductWidget3 extends StatefulWidget {
  final double size;
  final double spacing;
  final double fontSize;
  final double ratingFontSize;
  final bool editable;

  const RateProductWidget3({
    Key? key,
    this.size = 25.0,
    this.spacing = 10.0,
    this.fontSize = 14,
    this.ratingFontSize = 21,
    this.editable = true,
  }) : super(key: key);

  @override
  _RateProductWidget3State createState() => _RateProductWidget3State();
}

class _RateProductWidget3State extends State<RateProductWidget3> {
  int starRating = 0;

  List<Map<String, dynamic>> ratingData = [
    {
      'id': 1,
      'percentage': 2,
      'label': 'Poor',
    },
    {
      'id': 2,
      'percentage': 3,
      'label': 'Just okay',
    },
    {
      'id': 3,
      'percentage': 7,
      'label': 'Average',
    },
    {
      'id': 4,
      'percentage': 14,
      'label': 'Good',
    },
    {
      'id': 5,
      'percentage': 67,
      'label': 'Excellent',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Sort the ratingData list in descending order based on the percentage
    ratingData.sort((a, b) => b['percentage'].compareTo(a['percentage']));
  }

  void _setStarRating(int rate) {
    if (widget.editable) {
      setState(() {
        if (starRating == 1 && rate == 1) {
          starRating = 0;
        } else {
          starRating = rate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$starRating.0',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: widget.ratingFontSize,
                color: ColorRepo.dark,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 10),
            Text(
              'out of 5',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: widget.fontSize - 2,
                color: ColorRepo.dark,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i <= 5; i++) ...[
              GestureDetector(
                onTap: () {
                  _setStarRating(i);
                },
                child: Icon(
                  PhosphorIcons.star_fill,
                  color: starRating >= i ? ColorRepo.warning : ColorRepo.muted2,
                  size: widget.size,
                ),
              ),
              if (i < 5) SizedBox(width: widget.spacing),
            ],
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'based on 150 total ratings, 230 with review',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: widget.fontSize,
            color: ColorRepo.muted,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Column(
          children: List.generate(
            ratingData.length,
                (index) => _buildRatingDataWidget(
              ratingData[index]['label'],
              ratingData[index]['percentage'],
              ratingData[index]['id'],
              screenWidth,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingDataWidget(String label, int percentage, int id, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$id',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: widget.fontSize,
              color: ColorRepo.muted,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
          const Icon(
            PhosphorIcons.star_fill,
            color: ColorRepo.warning,
            size: 14,
          ),
          SizedBox(
            width: 60,
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: widget.fontSize,
                color: ColorRepo.dark,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          LoadingBarWidget(
            width: screenWidth * 0.40,
            percentage: double.parse(percentage.toString()),
            foregroundColor: ColorRepo.dark,
            backgroundColor: ColorRepo.muted2,
          ),
          SizedBox(
            width: 30,
            child: Text(
              '$percentage%',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: widget.fontSize,
                color: ColorRepo.dark,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
