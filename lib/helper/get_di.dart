import 'package:get/get.dart';
import 'package:nhs/controller/home_controller.dart';
import 'package:nhs/controller/login_controller.dart';
import 'package:nhs/controller/navigation_bar_controller.dart';
import 'package:nhs/controller/product_detail_controller.dart';
import 'package:nhs/controller/splash_controller.dart';
import 'package:nhs/data/api/api_client.dart';
import 'package:nhs/data/repository/all_products_repo.dart';
import 'package:nhs/data/repository/auth_repo.dart';
import 'package:nhs/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void init() async {

  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));

  // Repository
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => AllProductsRepo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => SplashController());
  Get.lazyPut(() => LoginController(authRepo: Get.find()));
  Get.lazyPut(() => NavigationBarController());
  Get.lazyPut(() => HomeController(allProductsRepo: Get.find()));
  Get.lazyPut(() => ProductDetailController());

}
