import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/controller/login_controller.dart';
import 'package:nhs/helper/route_helper.dart';
import 'package:nhs/theme/light_theme.dart';
import 'package:nhs/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    route();
  }

  void route(){
    Timer(const Duration(seconds: 3), () async {
      if(Get.find<LoginController>().isLoggedIn()) {
        Get.find<LoginController>().updateToken();
        Get.toNamed(RouteHelper.getNavBarRoute());
      }else {
        Get.toNamed(RouteHelper.getLoginRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
              width: context.width,
              height: context.height,
              color: light().primaryColor,
              child: Center(child: Image.asset(Images.logo)),
            )));
  }
}
