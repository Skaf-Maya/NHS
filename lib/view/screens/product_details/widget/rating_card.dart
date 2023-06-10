import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/controller/home_controller.dart';
import 'package:nhs/theme/light_theme.dart';
import 'package:nhs/utils/dimensions.dart';
import 'package:nhs/utils/styles.dart';
import 'package:nhs/view/base/rating.dart';
import 'package:nhs/view/screens/product_details/product_details_screen.dart';

class RatingCard extends StatelessWidget {

  final double height;
  final double radius;
  final String count;
  final String rate;
  final double iconSize;

  RatingCard({
    required this.height,
    required this.radius,
    required this.count,
    required this.rate,
    required this.iconSize
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: const Color(0xFFF1F1F1)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeMedium),
            child: Row(
              children: [
                Text("Reviews" + " ",style: titleMediumOpenSans.copyWith(color: light().canvasColor)),
                Text("("+count+")",style: titleMediumOpenSans.copyWith(color: light().canvasColor)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.paddingSizeLarge),
            child: Row(
              children: [
                Text(rate,style: titleMediumOpenSans.copyWith(color: Colors.black,fontSize: Dimensions.fontSizeExtraLarge)),
                const SizedBox(width: Dimensions.paddingSizeMedium),
                Rating(initialRating: double.parse(rate), iconSize: iconSize,iconColor: Colors.grey.withOpacity(0.5),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
