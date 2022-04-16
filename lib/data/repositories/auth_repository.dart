import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:food_delivery/modals/sign_in_body.dart';
import 'package:food_delivery/modals/sign_up_body.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) {
    return apiClient.post(AppConstants.REGISTRATION_UIR, signUpBody.toJson());
  }

  Future<Response> login(String phone, String password) {
    return apiClient
        .post(AppConstants.LOGIN_UIR, {"phone": phone, "password": password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      rethrow;
    }
  }

  bool userLoggedIN() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<String> getToken() async {

    return sharedPreferences.getString(AppConstants.TOKEN) ?? "none";
  }

  Future<bool> clearSharedPref(){
         sharedPreferences.remove(AppConstants.TOKEN);
         sharedPreferences.remove(AppConstants.PHONE);
    return     sharedPreferences.remove(AppConstants.PASSWORD);

  }
}
