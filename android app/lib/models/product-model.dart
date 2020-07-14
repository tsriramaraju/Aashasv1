import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final double price;
  bool isFavourite;
  bool isNew;
  bool designerCollection;
  bool trends;
  final List<String> size;
  final Map<String, List<String>> category;
  final List<String> images;
  final String description;

  Product(
      {this.description,
      this.id,
      this.size,
      this.images,
      this.category,
      this.isFavourite,
      this.name,
      this.isNew = false,
      this.price,
      this.designerCollection = false,
      this.trends = false});

  void toggleFavoriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
