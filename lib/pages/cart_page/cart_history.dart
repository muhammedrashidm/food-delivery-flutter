import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:food_delivery/modals/cart_modal.dart';
import 'package:food_delivery/pages/util_pages/n0_data_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/cart_controller.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryData().reversed.toList();

    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();
    var listCounter = 0;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: Dimensions.responsiveHeight10),
              color: AppColors.mainColor,
              height: Dimensions.responsiveHeight125,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BigText(text: 'Cart History'),
                  AppIcon(iconData: Icons.shopping_cart_outlined)
                ],
              ),
            ),
            GetBuilder<CartController>(builder: (controller) {
              bool isEmpty = controller.getCartHistoryData().isEmpty;

              return isEmpty
                  ? const NoDataPage(
                      text: "No Orders Found",
                      imagePath: 'assets/image/empty_box.png',
                    )
                  : Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.responsiveWidth10,
                            right: Dimensions.responsiveWidth10,
                            top: Dimensions.responsiveHeight10),
                        child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView(
                              children: [
                                for (int i = 0; i < itemsPerOrder.length; i++)
                                  Container(
                                    height: Dimensions.responsiveHeight125,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        (() {
                                          DateTime parseDate = DateFormat(
                                                  "yyyy-MM-dd HH:mm:ss")
                                              .parse(
                                                  getCartHistoryList[i].time!);
                                          var outputFormat =
                                              DateFormat("MM/dd/yyyy hh:mm a");

                                          var outputDate =
                                              outputFormat.format(parseDate);

                                          return BigText(
                                            text: outputDate,
                                            size: Dimensions.font20,
                                          );
                                        }()),
                                        SizedBox(
                                          height: Dimensions.responsiveHeight10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: List.generate(
                                                  itemsPerOrder[i], (index) {
                                                if (listCounter <
                                                    getCartHistoryList.length) {
                                                  listCounter++;
                                                }
                                                return index <= 2
                                                    ? Container(
                                                        margin: EdgeInsets.only(
                                                            right: Dimensions
                                                                .responsiveWidth5),
                                                        width: 80,
                                                        height: 80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    Dimensions
                                                                            .responsiveHeight15 /
                                                                        2),
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: NetworkImage(AppConstants
                                                                        .API_BASE_URL +
                                                                    '/uploads/' +
                                                                    getCartHistoryList[
                                                                            listCounter -
                                                                                1]
                                                                        .img!))),
                                                      )
                                                    : Container();
                                              }),
                                            ),
                                            Container(
                                              height: 80,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SmallText(text: 'Total'),
                                                  BigText(
                                                    text: itemsPerOrder[i]
                                                            .toString() +
                                                        'X items',
                                                    color: Colors.blueGrey,
                                                    size: Dimensions.font25,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      var timeList =
                                                          cartTimeToList();
                                                      Map<int, CartModal>
                                                          reOrderList = {};
                                                      for (var element
                                                          in getCartHistoryList) {
                                                        if (element.time ==
                                                            timeList[i]) {
                                                          reOrderList.putIfAbsent(
                                                              element.id!,
                                                              () => CartModal.fromJson(
                                                                  jsonDecode(
                                                                      jsonEncode(
                                                                          element))));
                                                        }
                                                      }
                                                      Get.find<CartController>()
                                                              .setItems =
                                                          reOrderList;
                                                      Get.find<CartController>()
                                                          .addToCartList();
                                                      Get.toNamed(
                                                          RouteHelper.cartPage);
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .mainColor,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      Dimensions
                                                                          .responsiveHeight5))),
                                                      child: SmallText(
                                                        text: 'one more',
                                                        color:
                                                            AppColors.mainColor,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.responsiveHeight20),
                                  )
                              ],
                            )),
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }
}
