import 'package:get/get.dart';

class Dimensions {

  static double fontSizeVerySmall = Get.context!.width >= 1300 ? 14 : 10;
  static double fontSizeSmall = Get.context!.width >= 1300 ? 17 : 13;
  static double fontExtraSmall = Get.context!.width >= 1300 ? 18 : 15;
  static double fontSizeDefault = Get.context!.width >= 1300 ? 21 : 17;
  static double fontSizeMedium = Get.context!.width >= 1300 ? 24 : 20;
  static double fontSizeLarge = Get.context!.width >= 1300 ? 32 : 28;
  static double fontSizeExtraLarge = Get.context!.width >= 1300 ? 36 : 32;
  static double fontSizeVeryLarge = Get.context!.width >= 1300 ? 30 : 34;

  static const double paddingSizeSmall = 5.0;
  static const double paddingSizeMedium = 10.0;
  static const double paddingSizeLarge = 20.0;
  static const double paddingSizeVeryLarge = 30.0;

  static const double smallSizeRadius = 10.0;
  static const double mediumSizeRadius = 15.0;
  static const double largeSizeRadius = 25.0;
  static const double extraLargeSizeRadius = 35.0;
  static const double veryLargeSizeRadius = 62.0;

}
