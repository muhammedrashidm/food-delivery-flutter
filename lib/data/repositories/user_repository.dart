import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:get/get.dart';

class UserRepo {
  final ApiClient apiClient;

  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() {
    print(AppConstants.TOKEN);
    return apiClient.getData(uri:AppConstants.USER_ENDPOINT);

  }
}
