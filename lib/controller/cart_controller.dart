import 'package:flutter/material.dart';
import 'package:nike_project/models/cart_data.dart';


class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    final existingItem = _items.indexWhere((e) => e.name == item.name);
    if (existingItem >= 0) {
      _items[existingItem].quantity++;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }
  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }

  double get totalPrice => _items.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );
}
