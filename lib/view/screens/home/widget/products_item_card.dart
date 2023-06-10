import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/controller/home_controller.dart';
import 'package:nhs/theme/light_theme.dart';
import 'package:nhs/utils/dimensions.dart';
import 'package:nhs/utils/styles.dart';
import 'package:nhs/view/base/rating.dart';
import 'package:nhs/view/screens/product_details/product_details_screen.dart';

class ProductsItemCard extends StatelessWidget {

  final int index;

  ProductsItemCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return InkWell(
          onTap: () {
            Get.to(() => ProductDetailsScreen(categoryID: homeController.allProductsList[index].id.toString(),index: index,));
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: context.width,
                      height: context.height * 0.3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(homeController.allProductsList[index].image!),
                              fit: BoxFit.cover
                          ),
                        borderRadius: BorderRadius.circular(Dimensions.mediumSizeRadius)
                      ),
                    ),
                    Positioned(
                      bottom: Dimensions.paddingSizeMedium,
                      left: Dimensions.paddingSizeLarge,
                      right: Dimensions.paddingSizeLarge,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${homeController.allProductsList[index].price!} AED", style: titleBoldOpenSans.copyWith(
                              color: light().cardColor,fontSize: Dimensions.fontSizeMedium),
                          ),
                          Rating(
                              initialRating: homeController.allProductsList[index].rating!.rate,
                              iconSize: Dimensions.fontSizeMedium
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.paddingSizeVeryLarge),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(homeController.allProductsList[index].title.toString(),style: titleItalicOpenSans.copyWith(fontStyle: FontStyle.italic)),
                      const SizedBox(height: Dimensions.paddingSizeMedium),
                      Text(homeController.allProductsList[index].description.toString(),style: titleRegularOpenSans.copyWith(color: light().secondaryHeaderColor)),
                      const SizedBox(height: Dimensions.paddingSizeMedium),
                    ],
                  ),
                ),
                index == (homeController.allProductsList.length -1 ) ? const Center() :
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                  thickness: 1,
                )
              ],
            ),
          )
      );
    });
  }
}
