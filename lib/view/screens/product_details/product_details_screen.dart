import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/controller/home_controller.dart';
import 'package:nhs/controller/product_detail_controller.dart';
import 'package:nhs/theme/light_theme.dart';
import 'package:nhs/utils/dimensions.dart';
import 'package:nhs/utils/styles.dart';
import 'package:nhs/view/base/custom_Icon_button.dart';
import 'package:nhs/view/base/custom_button.dart';
import 'package:nhs/view/screens/product_details/widget/rating_card.dart';

class ProductDetailsScreen extends StatelessWidget {

  final String categoryID;
  final int index;
  ProductDetailsScreen({required this.categoryID,required this.index});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return GetBuilder<ProductDetailController>(builder: (productDetailController) {
        return Scaffold(
            body: SafeArea(
              child: SizedBox(
                width: context.width,
                height: context.height,
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: context.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(homeController.allProductsList[index].image!),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Positioned(
                            top: Dimensions.paddingSizeLarge,
                            left: Dimensions.paddingSizeLarge,
                            right: Dimensions.paddingSizeLarge,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomIconButton(
                                      onPressed: () {
                                        Get.back();
                                        productDetailController.open.value = -1;
                                        // !homeController.isLoading;
                                      },
                                      icon: Icons.arrow_back,
                                      iconSize: Dimensions.paddingSizeLarge,
                                      iconColor: light().secondaryHeaderColor,
                                      width: 40,
                                      height: 40,
                                      radius: Dimensions.mediumSizeRadius,
                                      color: light().cardColor,
                                    ),
                                    CustomIconButton(
                                      onPressed: () {
                                        // todo menu
                                      },
                                      icon: Icons.more_vert,
                                      iconSize:  Dimensions.paddingSizeLarge,
                                      iconColor: light().secondaryHeaderColor,
                                      width: 40,
                                      height: 40,
                                      radius: Dimensions.mediumSizeRadius,
                                      color: light().cardColor,
                                    )
                                  ],
                                ),
                                const SizedBox(height: Dimensions.paddingSizeMedium),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Detail",
                                      style: titleBoldOpenSans.copyWith(
                                          color: light().cardColor,fontSize: Dimensions.fontSizeLarge),
                                    ),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: Dimensions.paddingSizeLarge,right: Dimensions.paddingSizeLarge),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${homeController.allProductsList[index].price!} AED", style: titleBoldOpenSans.copyWith(
                                    color: light().highlightColor,fontSize: Dimensions.fontSizeExtraLarge),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: context.width,
                            // height: context.height * 0.4,
                            decoration: BoxDecoration(
                              color: light().cardColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(Dimensions.extraLargeSizeRadius),
                                  topRight: Radius.circular(Dimensions.extraLargeSizeRadius)
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 5
                                ),
                              ],
                            ),
                            child: Obx(() => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
                              child: Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          if (productDetailController.open.value == 0) {
                                            productDetailController.open.value = -1;
                                          } else {
                                            productDetailController.open.value = 0;
                                          }
                                        },
                                        icon: Icon(productDetailController.open.value == 0 ?
                                        Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up_outlined,
                                          color: light().primaryColor,size: Dimensions.fontSizeLarge,
                                        ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomIconButton(
                                          onPressed: () {
                                            /// share
                                          },
                                          icon: Icons.ios_share,
                                          iconSize: Dimensions.paddingSizeLarge,
                                          iconColor: light().primaryColor,
                                          width: 40,
                                          height: 40,
                                          radius: Dimensions.mediumSizeRadius,
                                          color: light().cardColor,
                                        ),
                                        CustomButton(
                                          width: context.width * 0.7,
                                          height: 55,
                                          text: "Order Now",
                                          textStyle: titleBoldOpenSans.copyWith(
                                              color: light().cardColor,fontSize: Dimensions.fontSizeSmall),
                                          radius: Dimensions.veryLargeSizeRadius,
                                          onPressed: () {
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: Dimensions.paddingSizeMedium),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Description",style: titleItalicOpenSans.copyWith(fontStyle: FontStyle.italic,color: light().canvasColor)),
                                      ],
                                    ),
                                    const SizedBox(height: Dimensions.paddingSizeMedium),
                                    Text(homeController.allProductsList[index].description.toString(),style: titleRegularOpenSans.copyWith(color: light().canvasColor.withOpacity(0.5),fontSize: Dimensions.fontSizeSmall)),
                                    AnimatedSize(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                        child: Container(
                                          margin: EdgeInsets.only(top: (productDetailController.open.value) != 0 ? 0 : Dimensions.paddingSizeMedium,bottom: Dimensions.paddingSizeMedium),
                                          child: !(productDetailController.open.value == 0)
                                              ? const Center()
                                              : RatingCard(
                                              height: 100,
                                              radius: Dimensions.paddingSizeMedium,
                                              count: homeController.allProductsList[index].rating!.count.toString(),
                                              rate: homeController.allProductsList[index].rating!.rate.toString(),
                                              iconSize: Dimensions.fontSizeLarge - 3
                                          )
                                        ))
                                  ]),
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        );
      });
    });
  }
}
