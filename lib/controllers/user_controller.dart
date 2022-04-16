import 'dart:async';
import 'dart:convert';

import 'package:food_delivery/data/repositories/auth_repository.dart';
import 'package:food_delivery/data/repositories/user_repository.dart';
import 'package:food_delivery/modals/response_modal.dart';
import 'package:food_delivery/modals/sign_in_body.dart';
import 'package:food_delivery/modals/sign_up_body.dart';
import 'package:food_delivery/modals/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late UserModel _userModel;
  UserModel get userModel =>_userModel;

  Future<ResponseModal> getUserInfo() async {

    late ResponseModal responseModal;
    Response response = await userRepo.getUserInfo();
    if (response.statusCode == 200) {

      _userModel = UserModel.fromJson(response.body);

      responseModal = ResponseModal('successful', true);
    } else {
      responseModal = ResponseModal(response.statusText.toString(), false);
    }
    setIsLoading(false);

    return responseModal;
  }

  void setIsLoading(bool status) {
    _isLoading = status;
    update();
  }


}
