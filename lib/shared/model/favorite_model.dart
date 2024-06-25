import 'package:flutter/foundation.dart';

class FavoriteItem {
  final String id;
  final String name;
  final double price;
  final List<String> imageUrl;

  FavoriteItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class FavoriteModel with ChangeNotifier {
  final List<FavoriteItem> _items = [];

  List<FavoriteItem> get items => _items;

  void add(FavoriteItem item) {
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

  bool isInFavorites(String id) => _items.any((item) => item.id == id);

  int get totalItems => _items.length;
}
