import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/category_page_controller.dart';
import 'package:food_delivery/controllers/catogery_contoller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_foods_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/api/posts_api.dart';
import 'package:food_delivery/data/repositories/auth_repository.dart';
import 'package:food_delivery/data/repositories/cart_repository.dart';
import 'package:food_delivery/data/repositories/category_page_repository.dart';
import 'package:food_delivery/data/repositories/category_repository.dart';
import 'package:food_delivery/data/repositories/location_repo.dart';
import 'package:food_delivery/data/repositories/popular_product_repo.dart';
import 'package:food_delivery/data/repositories/recommended_food_repository.dart';
import 'package:food_delivery/data/repositories/user_repository.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  
  final sharedPref = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPref);
//apiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.API_BASE_URL, sharedPref: Get.find()));
  Get.lazyPut(() => PostsApiClient(appBaseUrl: 'https://pixabay.com'));
//repositories
  Get.lazyPut(() => PopularProductRepository(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedFoodRepository(apiClient: Get.find()));
  Get.lazyPut(() => CartRepository(sharedPref: Get.find()));
  Get.lazyPut(() => Categoryrepository(apiClient: Get.find()));
  Get.lazyPut(() => CategoryPageRepository(apiClient: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
//controllers
  Get.lazyPut(
      () => PopularProductController(popularProductRepository: Get.find()));
  Get.lazyPut(
      () => RecommendedFoodController(recommendedFoodRepository: Get.find()));
  Get.lazyPut(() => CartController(cartRepository: Get.find()));
  Get.lazyPut(() => CategoryController(categoryRepository: Get.find()));
  Get.lazyPut(() => CategoryPageController(categoryPageRepository: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));

}
