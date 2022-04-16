import 'package:food_delivery/data/repositories/cart_repository.dart';
import 'package:food_delivery/modals/products_modal.dart';
import 'package:get/get.dart';

import '../modals/cart_modal.dart';

class CartController extends GetxController {
  final CartRepository cartRepository;

  CartController({required this.cartRepository});

  Map<int, CartModal> _items = {};
  Map<int, CartModal> get items => _items;

  Map<int, CartModal> _historyitems = {};
  Map<int, CartModal> get historyitems => _historyitems;

  List<CartModal> storageCartItems = [];
  List<CartModal> storageCartItemsHistory = [];

  void addItem(ProductModal product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModal(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product);
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      _items.putIfAbsent(product.id!, () {
        return CartModal(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product);
      });
    }
    cartRepository.addToCartList(getItemsList);
    update();
  }

  bool existInCart(ProductModal productModal) {
    if (_items.containsKey(productModal.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModal productModal) {
    var quantity = 0;
    if (_items.containsKey(productModal.id)) {
      _items.forEach((key, value) {
        if (productModal.id == value.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });

    return totalQuantity;
  }

  List<CartModal> get getItemsList =>
      _items.entries.map((e) => e.value).toList();

  int get totalAmount {
    var total = 0;

    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartModal> getCartData() {
    setCart = cartRepository.getCartList();
    return storageCartItems;
  }

  set setCart(List<CartModal> cart) {
    storageCartItems = cart;
    for (var i = 0; i < cart.length; i++) {
      if (storageCartItems.isNotEmpty && storageCartItems[i].product is ProductModal) {
        _items.putIfAbsent(
            storageCartItems[i].product!.id!, () => storageCartItems[i]);
      }
    }
  }

  void addCartToHistory() {
    cartRepository.addCartToHistory();
    clear();
    update();
  }

  void clear() {
    _items = {};
    _items = {};
    update();
  }

  List<CartModal> getCartHistoryData() {
    setHistoryCart = cartRepository.getCartHistoryList();
    return storageCartItemsHistory;
  }

  set setHistoryCart(List<CartModal> cart) {
    storageCartItemsHistory = cart;
    _historyitems.addAll(cart.asMap().map((i, e) => MapEntry(i, e)));
    // for (var i = 0; i < cart.length; i++) {
    //   _historyitems.putIfAbsent(storageCartItemsHistory[i].product!.id!,
    //       () => storageCartItemsHistory[i]);
    // }
  }

  List<CartModal> get getHistoryItemsList {
    return _historyitems.entries.map((e) => e.value).toList();
  }

  set setItems(Map<int, CartModal> setItems) {
    _items = {};
    _items = setItems;
    update();
  }

  // TODO possible bug of product being null

  void addToCartList() {
    cartRepository.addToCartList(getItemsList);
    update();
  }

  void clearCartHistory(){
    cartRepository.clearCartHistory();
    update();
  }
}
