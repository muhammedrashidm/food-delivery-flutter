import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        height: Dimensions.responsiveHeight30*3,
        width: Dimensions.responsiveHeight30*3,
        padding: EdgeInsets.all(Dimensions.responsiveHeight30),
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.responsiveHeight30*2))),
        child: const CircularProgressIndicator(

          color: Colors.white,
        ),
      ),
    );
  }
}
