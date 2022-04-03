import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:food_delivery/pages/cart_page/cart_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pageId;
  final String? fromPage;

  const PopularFoodDetails({Key? key, required this.pageId, this.fromPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    var productC =
    Get.find<PopularProductController>();
      Get.find<PopularProductController>().initProductQuantity(
          cartController: Get.find<CartController>(), productModal: product);
  var itemss= productC.getItems;
  itemss.forEach((element) {
    print(element.id.toString()+':'+element.quantity.toString());
  });
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.popularFoodDetailsMainImageSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.API_BASE_URL +
                          '/uploads/' +
                          product.img))),
            ),
          ),
          Positioned(
            left: Dimensions.responsiveWidth15,
            top: Dimensions().calculateResponsiveHeight(60),
            right: Dimensions.responsiveWidth15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if(fromPage == 'cart_page'){
                      Get.toNamed(RouteHelper.getToCart());
                    }else {
                      Get.toNamed(RouteHelper.getToInitial());
                    }
                    },
                  child: AppIcon(iconData: Icons.arrow_back_ios),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: (){
                      controller.totalItems >= 1
                          ? Get.toNamed(RouteHelper.cartPage): (){};
                    },
                    child: Stack(
                      children: [
                        AppIcon(iconData: Icons.shopping_cart),
                        Positioned(
                          child:
                              controller.totalItems >= 1
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
                            size: 15,color: Colors.white,),
                          )
                              : Container(),
                          right: 4.5,
                          top: 1.75,
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularFoodDetailsMainImageSize - 20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.responsiveHeight10,
                  horizontal: Dimensions.responsiveWidth10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.responsiveHeight20),
                      topLeft: Radius.circular(Dimensions.responsiveHeight20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: product.name,
                    noOfStarts: product.stars,
                  ),
                  SizedBox(
                    height: Dimensions.responsiveHeight10,
                  ),
                  BigText(
                    text: 'Indroduce',
                    size: Dimensions.font30,
                  ),
                  SizedBox(
                    height: Dimensions.responsiveHeight10,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableText(text: product.description)))
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularFoodsController) {
          return Container(
            height: Dimensions.responsiveHeight125,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.responsiveWidth10,
                vertical: Dimensions.responsiveWidth10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.responsiveHeight30),
                  topRight: Radius.circular(Dimensions.responsiveHeight30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Dimensions().calculateResponsiveHeight(70),
                  padding: EdgeInsets.all(Dimensions.responsiveHeight10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(Dimensions.responsiveHeight20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                             popularFoodsController.setQuantity(false);
                          },
                          icon: const Icon(Icons.remove)),
                      const SizedBox(
                        width: 3,
                      ),
                      BigText(
                          text: popularFoodsController.inCartItems.toString()),
                      const SizedBox(
                        width: 3,
                      ),
                      IconButton(
                          onPressed: () {
                            popularFoodsController.setQuantity(true);
                          },
                          icon: const Icon(Icons.add))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularFoodsController.addItem(product);
                  },
                  child: Container(
                    height: Dimensions().calculateResponsiveHeight(70),
                    padding: EdgeInsets.all(Dimensions.responsiveHeight10),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(
                            Dimensions.responsiveHeight20)),
                    child: Center(
                        child: SmallText(
                      text:
                          '\$${product.price * popularFoodsController.inCartItems} | Save to cart',
                      color: Colors.white,
                      size: 18,
                    )),
                  ),
                )
              ],
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
