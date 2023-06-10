import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nhs/theme/light_theme.dart';

class Rating extends StatelessWidget {

  final double initialRating;
  final double iconSize;
  final Color? iconColor;


  const Rating({
    required this.initialRating,
    required this.iconSize,
    this.iconColor
  });


  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 1,
      direction: Axis.horizontal,
      glow: false,
      itemCount: 5,
      allowHalfRating: true,
      unratedColor: iconColor?? Colors.grey,
      itemSize: iconSize,
      itemBuilder: (context, _) => Icon(Icons.star, color: light().hintColor),
      onRatingUpdate: (_) {},
    );
  }
}
