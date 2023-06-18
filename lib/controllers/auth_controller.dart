import 'dart:async';

import 'package:food_delivery/data/repositories/auth_repository.dart';
import 'package:food_delivery/modals/response_modal.dart';
import 'package:food_delivery/modals/sign_in_body.dart';
import 'package:food_delivery/modals/sign_up_body.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModal> registration(SignUpBody signUpBody) async {
    setIsLoading(true);
    late ResponseModal responseModal;

    Response response = await authRepo.registration(signUpBody);

    if (response.statusCode == 200) {

      authRepo.saveUserToken(response.body["token"]);
      responseModal = ResponseModal(response.body["token"], true);
    } else {
      responseModal = ResponseModal(response.statusText.toString(), false);
    }
    setIsLoading(false);

    return responseModal;
  }

  Future<ResponseModal> login(String phone,String password) async {
    setIsLoading(true);
    late ResponseModal responseModal;
   return ResponseModal('fake_token', true);
    // Response response = await authRepo.login(phone,password);

    // if (response.statusCode == 200) {
    //   authRepo.saveUserToken(response.body["token"]);
    //   responseModal = ResponseModal(response.body["token"], true);

    // } else {
    //   responseModal = ResponseModal(response.statusText.toString(), false);
    // }
    // setIsLoading(false);

    // return responseModal;
  }
  Future<void>saveUserNumberAndPassword(String number,String password)async{
    try{
   authRepo.saveUserNumberAndPassword(number, password);
    }catch (e){
      rethrow;
    }
  }

  bool userLoggedIN() {
    return authRepo.userLoggedIN();
  }

  void setIsLoading(bool status) {
    _isLoading = status;
    update();
  }
  bool clearSharedPref(){
        authRepo.clearSharedPref();
        update();
        return true;

  }

  Future<String> getUserToken(){
    return authRepo.getToken();
  }

}

