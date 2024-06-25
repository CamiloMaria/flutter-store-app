import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  int quantity;
  final double price;
  final double discount;
  final List<String> imageUrl;
  final String category;
  final List<String> sizes;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.price,
    required this.discount,
    required this.imageUrl,
    required this.category,
    required this.sizes,
  });

  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ProductModel(
      id: doc.id,
      name: data['productName'] ?? '',
      description: data['productDescription'] ?? '',
      quantity: data['productQuantity'] ?? 0,
      price: data['productPrice'] ?? 0.0,
      discount: data['productDiscount'] ?? 0.0,
      imageUrl: List<String>.from(data['productImages'] ?? []),
      category: data['productCategory'] ?? '',
      sizes: List<String>.from(data['productSizes'] ?? []),
    );
  }
}
