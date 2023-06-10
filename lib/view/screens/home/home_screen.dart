import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/controller/home_controller.dart';
import 'package:nhs/utils/dimensions.dart';
import 'package:nhs/view/screens/home/widget/header.dart';
import 'package:nhs/view/screens/home/widget/products_item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>().getAllProductsList();
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(builder: (homeController) {
          return SizedBox(
            width: context.width,
            height: context.height,
            child: Stack(
              children: [
                ListView.builder(
                  padding: EdgeInsets.only(left: Dimensions.paddingSizeLarge,right: Dimensions.paddingSizeLarge,
                    top: context.height * 0.15
                  ),
                  itemCount: homeController.allProductsList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return ProductsItemCard(index: index);
                  },
                ),
                Positioned(
                  top: 0,
                  child: Header(text: "All Products"),
                ),
              ],
            ),
          );
        })
      ),
    );
  }
}