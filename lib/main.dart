import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/helper/route_helper.dart';
import 'package:nhs/utils/app_constants.dart';
import 'helper/get_di.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 300));
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme: ThemeData.light(),
      initialRoute: RouteHelper.getSplashRoute(),
      getPages: RouteHelper.routes,
    );
  }
}