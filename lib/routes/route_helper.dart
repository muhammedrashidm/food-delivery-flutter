import 'package:food_delivery/pages/cart_page/cart_page.dart';
import 'package:food_delivery/pages/food_detail/popular_food_detail.dart';
import 'package:food_delivery/pages/food_detail/recomended_food_details.dart';
import 'package:food_delivery/pages/food_main/main_food_page.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {

  static const String splash = '/splash';
  static const String initial = "/";
  static const String mainFoodPage = "/main_food_page";
  static const String popularFood = "/popular_food";
  static const String recommendedFood = "/recommended_food";
  static const String cartPage ='/cart_page';

  static String getToSplashScreen() => '$splash';
  static String getToInitial() => '$initial';
  static String getToMainFoodsPage() => '$mainFoodPage';
  static String getToPopularFoodDetails(int pageId,String fromPage) =>
      '$popularFood?pageId=$pageId&fromPage=$fromPage';
  static String getToRecommendedFoodDetails(int pageId,String fromPage) =>
      '$recommendedFood?pageId=$pageId&fromPage=$fromPage';
  static String getToCart()=>'$cartPage';

  static List<GetPage> routes = [
    GetPage(name: '/splash', page: () => const SplashScreen()
        ,
        transition: Transition.cupertino),

    GetPage(name: '/', page: () => const HomePage(),
        transition: Transition.cupertino),

    GetPage(name: '/main_food_page', page: () => const MainFoodPage(),
        transition: Transition.cupertino),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var fromPage = Get.parameters['fromPage'];
          return PopularFoodDetails(
            pageId: int.parse(pageId!),
            fromPage: fromPage,
          );
        },
        transition: Transition.cupertino
    ),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var fromPage = Get.parameters['fromPage'];
          return RecommendedFoodDetails(
            pageId: int.parse(pageId!),
            fromPage: fromPage,
          );
        },
        transition: Transition.cupertino),
    GetPage(name: cartPage, page: ()=> CartPage())
  ];
}
