import 'package:flutter/foundation.dart';
import 'package:project/shared/model/product_model.dart';

class CartModel extends ChangeNotifier {
  final List<ProductModel> _items = [];

  List<ProductModel> get items => _items;

  void add(ProductModel item) {
    if (_items.any((element) => element.id == item.id)) {
      return;
    }

    _items.add(item);
    notifyListeners();
  }

  void remove(String id) {
    if (!_items.any((element) => element.id == id)) {
      return;
    }

    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  bool isInCart(String id) => _items.any((item) => item.id == id);

  int get totalItems => _items.length;

  double get totalAmount =>
      _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    final item = _items.firstWhere((item) => item.id == id);
    item.quantity = quantity;
    notifyListeners();
  }
}
