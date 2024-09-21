import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';

class RateProductWidget extends StatefulWidget {
  final double size;
  final double spacing;
  final double fontSize;
  final bool editable;

  const RateProductWidget({
    Key? key,
    this.size = 30.0,
    this.spacing = 10.0,
    this.fontSize = 16,
    this.editable = true,
  }) : super(key: key);

  @override
  _RateProductWidgetState createState() => _RateProductWidgetState();
}

class _RateProductWidgetState extends State<RateProductWidget> {

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
    return Row(
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
        Text(
          '4 out of 5',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: widget.fontSize,
            color: ColorRepo.dark,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
