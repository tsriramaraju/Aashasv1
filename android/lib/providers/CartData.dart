import 'dart:collection';

import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/models/cart-model.dart';
import 'package:flutter/material.dart';

class CartData with ChangeNotifier {
  List<Cart> _items = [
    Cart(
        price: 90,
        id: 'c1',
        qty: 5,
        size: 'M',
        title: 'hello world',
        img: KOpeningImage),
    Cart(
        price: 90,
        id: 'c2',
        qty: 5,
        size: 'M',
        title: 'hello world',
        img: KMaleCat3Img)
  ];

  List<Cart> get items {
    return UnmodifiableListView(_items);
  }

  void addItem(String title, String size, double price, String id, String img) {
    final index = _items.indexWhere((element) => element.id == id);

    if (index > 0) {
      _items[index].qty++;
    } else
      _items.add(
        Cart(title: title, size: size, qty: 1, price: price, id: id, img: img),
      );
    notifyListeners();
  }

  void updateCart(String id, String type) {
    final index = _items.indexWhere((element) => element.id == id);
    if (type == 'decrement')
      _items[index].qty--;
    else if (type == 'increment') _items[index].qty++;
    notifyListeners();
  }

  void delete(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void deleteAll() {
    _items.clear();
    notifyListeners();
  }

  int get totalAmount {
    double sum = 0;
    _items.forEach((element) {
      sum += (element.price * element.qty);
    });
    return sum.toInt();
  }
}
