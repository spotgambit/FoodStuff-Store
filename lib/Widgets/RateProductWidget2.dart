import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';

class RateProductWidget2 extends StatefulWidget {
  final double size;
  final double spacing;
  final double fontSize;
  final bool editable;

  const RateProductWidget2({
    Key? key,
    this.size = 30.0,
    this.spacing = 10.0,
    this.fontSize = 16,
    this.editable = true,
  }) : super(key: key);

  @override
  _RateProductWidget2State createState() => _RateProductWidget2State();
}

class _RateProductWidget2State extends State<RateProductWidget2> {

  int starRating = 0;

  void _setStarRating(int rate){
    if(widget.editable){
      setState(() {
        if(starRating == 1 && rate == 1) {
          starRating = 0;
        } else {
          starRating = rate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Score Item',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: widget.fontSize,
            color: ColorRepo.dark,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                _setStarRating(1);
              },
              child: Icon(
                PhosphorIcons.star_fill,
                color: starRating >= 1 ? ColorRepo.warning : ColorRepo.muted2,
                size: widget.size,
              ),
            ),
            SizedBox(width: widget.spacing),
            GestureDetector(
              onTap: (){
                _setStarRating(2);
              },
              child: Icon(
                PhosphorIcons.star_fill,
                color: starRating > 1 ? ColorRepo.warning : ColorRepo.muted2,
                size: widget.size,
              ),
            ),
            SizedBox(width: widget.spacing),
            GestureDetector(
              onTap: (){
                _setStarRating(3);
              },
              child: Icon(
                PhosphorIcons.star_fill,
                color: starRating > 2 ? ColorRepo.warning : ColorRepo.muted2,
                size: widget.size,
              ),
            ),
            SizedBox(width: widget.spacing),
            GestureDetector(
              onTap: (){
                _setStarRating(4);
              },
              child: Icon(
                PhosphorIcons.star_fill,
                color: starRating > 3 ? ColorRepo.warning : ColorRepo.muted2,
                size: widget.size,
              ),
            ),
            SizedBox(width: widget.spacing),
            GestureDetector(
              onTap: (){
                _setStarRating(5);
              },
              child: Icon(
                PhosphorIcons.star_fill,
                color: starRating > 4 ? ColorRepo.warning : ColorRepo.muted2,
                size: widget.size,
              ),
            ),
            SizedBox(width: widget.spacing),
          ],
        ),
        const SizedBox(height: 20),
        starRating < 1 ? const SizedBox() : Text(
          '$starRating out of 5',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: widget.fontSize,
            color: ColorRepo.dark,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
