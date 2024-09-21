import 'package:flutter/material.dart';
import 'package:groceryshop/Repo/ColorRepo.dart';
import 'package:groceryshop/Screens/DescriptionScreens/DescriptionScreen.dart';

class MediaCarouselLiteWidget extends StatefulWidget {
  final List<String> images;
  final Function function;

  const MediaCarouselLiteWidget({super.key, required this.images, required this.function});

  @override
  _MediaCarouselLiteWidgetState createState() => _MediaCarouselLiteWidgetState();
}

class _MediaCarouselLiteWidgetState extends State<MediaCarouselLiteWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.images.length,
              (index) => _buildTextPill(widget.images[index]),
        ),
      ),
    );
  }

  Widget _buildTextPill(String image) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () => widget.function(),
        child: Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorRepo.mutedLite2,
              width: 1.0,
            ),
          ),
          child: Image.network(
            image,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
