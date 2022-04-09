import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/recommended_foods_controller.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:food_delivery/pages/cart_page/cart_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/popular_product_controller.dart';

class RecommendedFoodDetails extends StatelessWidget {
  RecommendedFoodDetails({Key? key, required this.pageId, this.fromPage})
      : super(key: key);
  final int pageId;
  final String? fromPage;

  int count = 0;

  @override
  Widget build(BuildContext context) {
    print(pageId);
    var product =
        Get.find<RecommendedFoodController>().recommendedFoodList[pageId];
    Get.find<PopularProductController>().initProductQuantity(
        cartController: Get.find<CartController>(), productModal: product);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (fromPage == 'cart_page') {
                      Get.toNamed(RouteHelper.getToCart());
                    } else {
                      Get.toNamed(RouteHelper.getToInitial());
                    }
                  },
                  child: AppIcon(iconData: Icons.close),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      GestureDetector(
                          onTap: () {
                            controller.totalItems >= 1
                                ? Get.toNamed(RouteHelper.cartPage)
                                : () {};
                          },
                          child: AppIcon(iconData: Icons.shopping_cart)),
                      Positioned(
                        child:
                            Get.find<PopularProductController>().totalItems >= 1
                                ? Container(
                                    child: AppIcon(
                                      iconData: Icons.circle,
                                      size: 20,
                                      iconColor: Colors.transparent,
                                      backGroundColor: AppColors.mainColor,
                                    ),
                                  )
                                : Container(),
                        right: 0,
                        top: 0,
                      ),
                      Positioned(
                        child:
                            Get.find<PopularProductController>().totalItems >= 1
                                ? Container(
                                    child: BigText(
                                      text: controller.totalItems.toString(),
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(),
                        right: 4.5,
                        top: 1.75,
                      ),
                    ],
                  );
                })
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(35),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.responsiveHeight20),
                        topRight:
                            Radius.circular(Dimensions.responsiveHeight20)),
                    color: Colors.white),
                child: Center(
                    child: BigText(
                  text: product.name,
                  size: Dimensions.font25,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.API_BASE_URL + '/uploads/' + product.img,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.responsiveWidth10,
                      right: Dimensions.responsiveWidth10),
                  child: ExpandableText(
                    text: product.description,
                    textHeight: Dimensions.screenHeight / 4.5,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Container(
            height: Dimensions().calculateResponsiveHeight(190),
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.responsiveHeight10,
                      horizontal: Dimensions.responsiveWidth20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(false);
                        },
                        child: AppIcon(
                          iconData: Icons.remove,
                          backGroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                        ),
                      ),
                      BigText(
                          text: "\$${product.price}" +
                              " X " +
                              controller.inCartItems.toString()),
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(true);
                        },
                        child: AppIcon(
                            iconData: Icons.add,
                            backGroundColor: AppColors.mainColor,
                            iconColor: Colors.white),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(Dimensions.responsiveHeight30),
                            topLeft: Radius.circular(
                                Dimensions.responsiveHeight30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                              Dimensions().calculateResponsiveHeight(10)),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                Dimensions.responsiveHeight15,
                              )),
                          height: Dimensions().calculateResponsiveHeight(60),
                          width: Dimensions().calculateResponsiveHeight(60),
                          child: AppIcon(
                            iconData: Icons.favorite,
                            iconColor: AppColors.mainColor,
                            backGroundColor: Colors.white,
                            iconSize: Dimensions.iconSize24,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.addItem(product);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.responsiveWidth10,
                                vertical: Dimensions.responsiveHeight15),
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(
                                  Dimensions.responsiveHeight15,
                                )),
                            child: SmallText(
                              text:
                                  "\$${product.price * controller.inCartItems} | Save to cart",
                              color: Colors.white,
                              size: Dimensions.font25,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
