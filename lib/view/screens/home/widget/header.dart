import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/theme/light_theme.dart';
import 'package:nhs/utils/dimensions.dart';
import 'package:nhs/utils/styles.dart';

class Header extends StatelessWidget {

  final String text;

  Header({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.width / 4,
      decoration: BoxDecoration(
        color: light().cardColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Dimensions.extraLargeSizeRadius),
          bottomRight: Radius.circular(Dimensions.extraLargeSizeRadius)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(text,style: titleBoldOpenSans.copyWith(fontSize: Dimensions.fontSizeLarge,color: light().secondaryHeaderColor)),
      ),
    );
  }
}
