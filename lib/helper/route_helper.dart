import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/view/screens/bottom_navigation_bar/navigation_bar_screen.dart';
import 'package:nhs/view/screens/cart/cart_screen.dart';
import 'package:nhs/view/screens/home/home_screen.dart';
import 'package:nhs/view/screens/login/login_screen.dart';
import 'package:nhs/view/screens/product_details/product_details_screen.dart';
import 'package:nhs/view/screens/profile/profile_screen.dart';
import 'package:nhs/view/screens/splash/splash_screen.dart';
import 'package:nhs/view/screens/wishlist/wishlist_screen.dart';

class RouteHelper {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String navBar = '/nav-bar';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String wishlist = '/wishlist';
  static const String profile = '/profile';
  static const String productItem = '/product-item';


  static String getSplashRoute() => splash;
  static String getLoginRoute() => login;
  static String getNavBarRoute() => navBar;
  static String getHomeRoute() => home;
  static String getCartRoute() => cart;
  static String getWishlistRoute() => wishlist;
  static String getProfileRoute() => profile;
  static String getProductItemRoute(int id,int index) {
    return 'productItem?id=$id';
  }


  static List<GetPage> routes = [
    GetPage(name: splash, page: () => getRoute(const SplashScreen())),
    GetPage(name: login, page: () => getRoute(const LoginScreen())),
    GetPage(name: navBar, page: () => getRoute(const NavigationBarScreen())),
    GetPage(name: home, page: () => getRoute(const HomeScreen())),
    GetPage(name: cart, page: () => getRoute(const CartScreen())),
    GetPage(name: wishlist, page: () => getRoute(const WishlistScreen())),
    GetPage(name: profile, page: () => getRoute(const ProfileScreen())),
    GetPage(name: productItem, page: () {
      return getRoute(ProductDetailsScreen(categoryID: Get.parameters["id"].toString(),index: 0));
    }),
  ];

  static getRoute(Widget navigateTo) => navigateTo;
}
