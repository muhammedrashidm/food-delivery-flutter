import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions().calculateResponsiveHeight(50),
                  bottom: Dimensions.responsiveHeight15),
              padding: EdgeInsets.only(
                  left: Dimensions.responsiveWidth10,
                  right: Dimensions.responsiveWidth10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        BigText(
                          text: "Indian",
                          color: AppColors.mainColor,
                          size: Dimensions.font30,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: 'Calicut',
                              color: Colors.black,
                              size: Dimensions.font10,
                            ),
                            const Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.responsiveHeight45,
                      height: Dimensions.responsiveHeight45,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(
                              Dimensions.responsiveHeight10)),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      ),
    );
  }
}
