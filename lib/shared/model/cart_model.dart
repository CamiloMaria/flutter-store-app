import 'package:flutter/foundation.dart';
import 'package:project/shared/model/product_model.dart';

class CartModel extends ChangeNotifier {
  final List<ProductModel> _items = [];

  List<ProductModel> get items => _items;

  void add(ProductModel item) {
    _items.add(item);
    notifyListeners();
  }
}
