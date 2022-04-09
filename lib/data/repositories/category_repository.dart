import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Categoryrepository extends GetxService {
  final ApiClient apiClient;

  Categoryrepository({required this.apiClient});

  // Future<Response> getCategoryList() async {
  //   return apiClient.getData(AppConstants.CATEGORY_ENDPOINT);
  // }

  List<String> getCategoryList() {
    return [
      "popular",
      "recommended",
      "popular",
      "recommended",
      "popular",
      "recommended"
    ];
  }
}
