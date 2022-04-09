import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:get/get.dart';

class CategoryPageRepository extends GetxService {
  final ApiClient apiClient;

  CategoryPageRepository({required this.apiClient});

  Future<Response> getProductList({required String endpoint}) async {
    return apiClient.getData(AppConstants.API_BASE_PRODUCT_URL + endpoint);
  }
}
