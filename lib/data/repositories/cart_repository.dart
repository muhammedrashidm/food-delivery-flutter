import 'dart:convert';

import 'package:food_delivery/helper/appConstants.dart';
import 'package:food_delivery/modals/products_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modals/cart_modal.dart';

class CartRepository {
  final SharedPreferences sharedPref;

  CartRepository({required this.sharedPref});

  List<String> cart = [];
  List<String> cartHistory = [];
  List<String> historyCart = [];

  void addToCartList(List<CartModal> cartList) {
    // sharedPref.remove(AppConstants.CART_LIST_KEY);
    // sharedPref.remove(AppConstants.CART_HISTORY_KEY);
    // return;
    var time = DateTime.now().toString();
    cart = [];
    for (var element in cartList) {
      if(element.product is ProductModal){
        element.time = time;
        cart.add(jsonEncode(element));
      }

    }
    sharedPref.setStringList(AppConstants.CART_LIST_KEY, cart);
  }

  List<CartModal> getCartList() {
    print('geting cart list');
    List<CartModal> cartList = [];
    if (sharedPref.containsKey(AppConstants.CART_LIST_KEY)) {
      cart = sharedPref.getStringList(AppConstants.CART_LIST_KEY) ?? [];
      for (var element in cart) {
        cartList.add(CartModal.fromJson(jsonDecode(element)));
      }
    }

    return cartList;
  }

  void addCartToHistory() {
    cartHistory = [];

    if (sharedPref.containsKey(AppConstants.CART_HISTORY_KEY)) {
      cartHistory =
          sharedPref.getStringList(AppConstants.CART_HISTORY_KEY) ?? [];
    }
    for (var item in cart) {
      cartHistory.add(item);
    }

    sharedPref.setStringList(AppConstants.CART_HISTORY_KEY, cartHistory);
    cart = [];
    removeCart();
  }

  void removeCart() {
    sharedPref.remove(AppConstants.CART_LIST_KEY);
  }

  List<CartModal> getCartHistoryList() {
    List<CartModal> cartList = [];
    if (sharedPref.containsKey(AppConstants.CART_HISTORY_KEY)) {
      historyCart = [];
      historyCart =
          sharedPref.getStringList(AppConstants.CART_HISTORY_KEY) ?? [];
      for (var element in historyCart) {
        cartList.add(CartModal.fromJson(jsonDecode(element)));
      }
    }
    return cartList;
  }
}
