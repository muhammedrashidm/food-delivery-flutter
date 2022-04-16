import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/helper/appConstants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modals/adress_model.dart';

class LocationRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAddressFromGeocode(LatLng latLng) async{
    return await apiClient.getData(uri: '${AppConstants.GEOCODE_URI}?lat=${latLng.latitude}&lng=${latLng.longitude}');
  }


  Future<Response> addAddress(AddressModal addressModal)async{
   return await apiClient.postData(AppConstants.ADD_USER_ADDRESS, addressModal.toJson());
  }


  String getUserAddressFromLocStore() {
    return sharedPreferences.getString(AppConstants.USER_ADDRESS)??"";
  }

  Future<Response> getAllAddress()async {
    return await apiClient.getData(uri: AppConstants.ADDRESS_LIST);
  }

  Future<bool> saveToLocal(String userAddress) async{
    apiClient.updateHeader(sharedPreferences.getString(AppConstants.TOKEN)!);
    return await sharedPreferences.setString(AppConstants.USER_ADDRESS, userAddress);
  }



}