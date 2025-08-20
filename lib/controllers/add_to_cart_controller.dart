import 'package:e_commerce_depi/models/items_model.dart';
import 'package:flutter/material.dart';

class AddToCartController extends ChangeNotifier {
  final List<ItemModel> _cartItems = [];

  List<ItemModel> get cartItems => List.unmodifiable(_cartItems);

  void addToCart(ItemModel item) {
    final index = _cartItems.indexWhere((i) => i.name == item.name);
    if (index == -1) {
      _cartItems.add(item.copyWith(quantity: 1, isAddedToCart: true));
    } else {
      _cartItems[index].quantity++;
    }
    notifyListeners();
  }

  void removeFromCart(ItemModel item) {
    final index = _cartItems.indexWhere((i) => i.name == item.name);
    if (index != -1) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      } else {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  bool isInCart(ItemModel item) {
    return _cartItems.any((i) => i.name == item.name);
  }

  int getQuantity(ItemModel item) {
    final index = _cartItems.indexWhere((i) => i.name == item.name);
    if (index != -1) {
      return _cartItems[index].quantity;
    }
    return 0;
  }
}
