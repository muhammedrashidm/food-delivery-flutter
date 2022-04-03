import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repositories/popular_product_repo.dart';
import 'package:food_delivery/modals/cart_modal.dart';
import 'package:food_delivery/modals/products_modal.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepository popularProductRepository;

  PopularProductController({required this.popularProductRepository});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cartController;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepository.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];

      _popularProductList
          .addAll(ProductsModal.fromJson(response.body).productsList!);
      _isLoaded = true;
      update();
    } else {
      print(response.statusText);
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = _checkQuantity(_quantity + 1);
    } else {
      _quantity = _checkQuantity(_quantity - 1);
    }
    update();
  }

  int _checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item Count", "Can't remove from empty List",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Item Count", "Can't Add More",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProductQuantity(
      {required CartController cartController,
      required ProductModal productModal}) {
    _quantity = 0;
    _inCartItems = 0;
    _cartController = cartController;
    //if exist()
    var exist = false;
    exist = _cartController.existInCart(productModal);

    if (exist == true) {
      _inCartItems = _cartController.getQuantity(productModal);
    }

    // get _inCartItems from storage
    //this is not to globall cart, its in product page cart
  }

  void addItem(ProductModal product) {
    if (_quantity == 0) {
      Get.snackbar("Item Count", "Quantity is 0, Pleas add some quantity",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
    } else {
      _cartController.addItem(product, _quantity);
      _quantity = 0;
      _inCartItems = _cartController.getQuantity(product);
      _cartController.items.forEach((key, value) {});
    }
    update();
  }

  int get totalItems {
    return _cartController.totalItems;
  }

  List<CartModal> get getItems => _cartController.getItemsList;
}
