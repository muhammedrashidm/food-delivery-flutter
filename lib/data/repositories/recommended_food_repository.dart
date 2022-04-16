import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:get/get.dart';

class RecommendedFoodRepository extends GetxService{
  
  final ApiClient apiClient;

  RecommendedFoodRepository({required this.apiClient});
  
  Future<Response>getRecomendedFoodResponse()async{
    return await apiClient.getData(uri:AppConstants.RECOMMENDED_PRODUCT_ENDPOINT);
  }
  
}