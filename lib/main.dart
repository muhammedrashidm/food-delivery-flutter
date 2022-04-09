import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_foods_controller.dart';
import 'package:food_delivery/data/api/posts_api.dart';

import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependenciies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    Get.find<CartController>().getCartHistoryData();
    Get.find<PostsApiClient>().getData('/api/');
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedFoodController>(builder: (_) {
        return GetMaterialApp(
          //home: SplashScreen(),
          // food_main: MainFoodPage(),
          initialRoute: RouteHelper.splash,
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
