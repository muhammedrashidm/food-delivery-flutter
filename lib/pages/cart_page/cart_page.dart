import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_foods_controller.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:food_delivery/modals/cart_modal.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/util_pages/n0_data_page.dart';

import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          var isEmpty = cartController.getItemsList.isEmpty;
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
                      BigText(
                          text: '\$ ${cartController.totalAmount.toString()}')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    !isEmpty
                        ? cartController.addCartToHistory()
                        : Get.toNamed(RouteHelper.initial);
                  },
                  child: Container(
                    height: Dimensions().calculateResponsiveHeight(70),
                    padding: EdgeInsets.all(Dimensions.responsiveHeight10),
                    decoration: BoxDecoration(
                        color: !isEmpty ? AppColors.mainColor : Colors.grey,
                        borderRadius: BorderRadius.circular(
                            Dimensions.responsiveHeight20)),
                    child: Center(
                        child: SmallText(
                      text: !isEmpty
                          ? 'Proceed To Checkout'
                          : "Pleas Add Some Items",
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
      body: Stack(
        children: [
          GetBuilder<CartController>(builder: (controller) {
            bool isEmpty = controller.getItemsList.isEmpty;
            return isEmpty
                ? const NoDataPage(text: 'Your Cart Is Empty')
                : Positioned(
                    top: Dimensions.responsiveHeight20 * 5,
                    left: Dimensions.responsiveWidth10,
                    right: Dimensions.responsiveWidth10,
                    bottom: 0,
                    child: GetBuilder<CartController>(
                      builder: (controller) {
                        List<CartModal> _cartList = controller.getItemsList;
                        return ListView.builder(
                          itemCount: _cartList.length,
                          itemBuilder: (_, index) {
                            CartModal cartItem = _cartList[index];

                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.responsiveHeight10),
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 150,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // TODO: implement product view from cart after restart
                                      var popularIndex =
                                          Get.find<PopularProductController>()
                                              .popularProductList
                                              .indexWhere((element) =>
                                                  element.id ==
                                                  cartItem.product!.id);

                                      if (popularIndex >= 0) {
                                        Get.toNamed(
                                            RouteHelper.getToPopularFoodDetails(
                                                popularIndex, 'cart_page'));
                                      } else {
                                        var recommendedIndex = Get.find<
                                                RecommendedFoodController>()
                                            .recommendedFoodList
                                            .indexWhere((element) =>
                                                element.id ==
                                                cartItem.product!.id);

                                        if (recommendedIndex >= 0) {
                                          Get.toNamed(RouteHelper
                                              .getToRecommendedFoodDetails(
                                                  recommendedIndex,
                                                  'cart_page'));
                                        } else {
                                          Get.snackbar("Message",
                                              'Product Page Is Not Available');
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: Dimensions.responsiveHeight125,
                                      height: Dimensions.responsiveHeight125,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.responsiveWidth10),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  AppConstants.API_BASE_URL +
                                                      '/uploads/' +
                                                      cartItem.img!))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.responsiveWidth5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              Dimensions.responsiveHeight15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BigText(
                                            text: kDebugMode
                                                ? cartItem.product!.id
                                                        .toString() +
                                                    ': ' +
                                                    cartItem.id.toString() +
                                                    cartItem.name!
                                                : cartItem.name!,
                                            color: Colors.blueGrey,
                                          ),
                                          SmallText(
                                            text: 'Spicy',
                                            color: AppColors.paraColor,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                text: '\$' +
                                                    (cartItem.price! *
                                                            cartItem.quantity!)
                                                        .toString(),
                                                color: AppColors.paraColor,
                                              ),
                                              Container(
                                                height: Dimensions
                                                    .responsiveHeight30,
                                                padding:
                                                    const EdgeInsets.all(0),
                                                decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 0.2,
                                                      )
                                                    ]),
                                                child: Center(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () =>
                                                            controller.addItem(
                                                                cartItem
                                                                    .product!,
                                                                -1),
                                                        child: AppIcon(
                                                          iconData:
                                                              Icons.remove,
                                                          backGroundColor:
                                                              Colors.white70,
                                                        ),
                                                      ),
                                                      BigText(
                                                        size: Dimensions.font25,
                                                        text: cartItem.quantity
                                                            .toString(), //popularFoodsController.inCartItems.toString(),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () =>
                                                            controller.addItem(
                                                                cartItem
                                                                    .product!,
                                                                1),
                                                        child: AppIcon(
                                                          iconData: Icons.add,
                                                          backGroundColor:
                                                              Colors.white70,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
          }),
          Positioned(
              top: Dimensions.responsiveHeight20 * 3,
              left: Dimensions.responsiveWidth20,
              right: Dimensions.responsiveWidth20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('tapped');
                      // Get.toNamed(RouteHelper.getToInitial());
                      Get.to(() => const HomePage());
                    },
                    child: AppIcon(
                        iconColor: Colors.white,
                        backGroundColor: AppColors.mainColor,
                        iconData: Icons.arrow_back_ios),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () => Get.to(() => const HomePage()),
                    child: AppIcon(
                        iconColor: Colors.white,
                        backGroundColor: AppColors.mainColor,
                        iconData: Icons.home_outlined),
                  ),
                  SizedBox(
                    width: Dimensions.responsiveWidth5,
                  ),
                  AppIcon(
                      iconColor: Colors.white,
                      backGroundColor: AppColors.mainColor,
                      iconData: Icons.shopping_cart),
                ],
              ))
        ],
      ),
    );
  }
}
