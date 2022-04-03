import 'package:get/get.dart';

class Dimensions {
//926
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.height;
  double calculateResponsiveHeight(double height) {
    return screenHeight / (926 / height);
  }

  double calculateResponsiveWidth(double width) {
    return screenWidth / (390 / width);
  }

  static double pageViewHeight = screenHeight / 2.89;
  static double pageViewBGHeight = screenHeight / 4.20;
  static double pageViewFGHeight = screenHeight / 7.12;

  static double responsiveHeight125 = screenHeight / 7.408;
  static double textBoxHeight105 = screenHeight / 8.81;

  static double responsiveHeight5 = screenHeight / 185.2;
  static double responsiveHeight10 = screenHeight / 92.6;
  static double responsiveHeight15 = screenHeight / 61.733;
  static double responsiveHeight20 = screenHeight / 46.3;
  static double responsiveHeight25 = screenHeight / 37.04;
  static double responsiveHeight30 = screenHeight / 30.86;
  static double responsiveHeight45 = screenHeight / 20.57;

  static double responsiveWidth5 = screenWidth / 78;
  static double responsiveWidth10 = screenWidth / 39;
  static double responsiveWidth15 = screenWidth / 26;
  static double responsiveWidth20 = screenWidth / 19.5;
  static double responsiveWidth25 = screenWidth / 15.6;
  static double responsiveWidth30 = screenWidth / 13;
  static double responsiveWidth45 = screenWidth / 8.66;
//font size
  static double font10 = screenHeight / 92.6;
  static double font15 = screenHeight / 61.733;
  static double font20 = screenHeight / 46.3;
  static double font25 = screenHeight / 37.04;
  static double font30 = screenHeight / 30.86;

  static double iconSize24 = screenHeight / 38.58;
  static double iconSize18 = screenHeight / 50.44;


  ///popular food details page
   static double popularFoodDetailsMainImageSize = screenHeight * .45;
}
