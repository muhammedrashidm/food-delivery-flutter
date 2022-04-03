import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_foods_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repositories/cart_repository.dart';
import 'package:food_delivery/data/repositories/popular_product_repo.dart';
import 'package:food_delivery/data/repositories/recommended_food_repository.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPref = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPref);

  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.API_BASE_URL));
//repositories
  Get.lazyPut(() => PopularProductRepository(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedFoodRepository(apiClient: Get.find()));
  Get.lazyPut(() => CartRepository(sharedPref: Get.find()));
//controllers
  Get.lazyPut(
      () => PopularProductController(popularProductRepository: Get.find()));
  Get.lazyPut(
      () => RecommendedFoodController(recommendedFoodRepository: Get.find()));
  Get.lazyPut(() => CartController(cartRepository: Get.find()));
}
