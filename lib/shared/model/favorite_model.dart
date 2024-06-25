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
    _items.add(item);
    notifyListeners();
  }

  void remove(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  bool isFavorite(String id) => _items.any((item) => item.id == id);

  int get totalItems => _items.length;
}
