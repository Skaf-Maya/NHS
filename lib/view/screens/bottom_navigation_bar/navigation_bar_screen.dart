import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/controller/navigation_bar_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nhs/theme/light_theme.dart';
import 'package:nhs/utils/dimensions.dart';
import 'package:nhs/utils/images.dart';
import 'package:nhs/view/screens/cart/cart_screen.dart';
import 'package:nhs/view/screens/home/home_screen.dart';
import 'package:nhs/view/screens/profile/profile_screen.dart';
import 'package:nhs/view/screens/wishlist/wishlist_screen.dart';

class NavigationBarScreen extends StatefulWidget {

  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(),
      bottomNavigationBar: GetBuilder<NavigationBarController>(builder: (navBarController) {
        return  Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(Dimensions.largeSizeRadius), topLeft: Radius.circular(Dimensions.largeSizeRadius)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 5
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Dimensions.largeSizeRadius),
                topRight: Radius.circular(Dimensions.largeSizeRadius)
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(Images.homeIcon, color: navBarController.selectNavBar.value == 0 ? light().primaryColor : Colors.grey.withOpacity(0.5)),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(Images.cartIcon,color: navBarController.selectNavBar.value == 1 ? light().primaryColor : Colors.grey.withOpacity(0.5)),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(Images.likeIcon,color: navBarController.selectNavBar.value == 2 ? light().primaryColor : Colors.grey.withOpacity(0.5)),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(Images.userIcon,color: navBarController.selectNavBar.value == 3 ? light().primaryColor : Colors.grey.withOpacity(0.5)),
                    label: ""
                ),
              ],
              currentIndex: navBarController.selectNavBar.value,
              onTap: (index) async {
                setState(() {
                  navBarController.selectNavBar.value = index;
                });
              },
            ),
          ),
        );
      }),
    );
  }

   callPage() {
    return GetBuilder<NavigationBarController>(builder: (navBarController) {
      return navBarController.selectNavBar.value == 0 ? const HomeScreen() :
      navBarController.selectNavBar.value == 1 ? const CartScreen() :
      navBarController.selectNavBar.value == 2 ? const WishlistScreen() : const ProfileScreen();
    });
  }

}