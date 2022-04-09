import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:get/get.dart';

class PopularProductRepository extends GetxService {
  final ApiClient apiClient;

  PopularProductRepository({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return apiClient.getData(AppConstants.POPULAR_PRODUCT_ENDPOINT);
  }
}
