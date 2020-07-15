import 'dart:collection';
import 'dart:convert';
import 'package:aashas/helpers/constants/variables.dart';
import 'package:aashas/models/Favourites-model.dart';
import 'package:aashas/providers/Users.dart';
import 'package:http/http.dart' as http;
import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/models/cart-model.dart';
import 'package:flutter/material.dart';
import '';

class Favourites with ChangeNotifier {
  final Users user;
  Favourites(this.user);
  List<Favourite> _items = [
//    Cart(
//        price: 90,
//        id: 'c1',
//        qty: 5,
//        size: 'M',
//        title: 'hello world',
//        img: KOpeningImage),
//    Cart(
//        price: 90,
//        id: 'c2',
//        qty: 5,
//        size: 'M',
//        title: 'hello world',
//        img: KMaleCat3Img)
  ];

  List<Favourite> get items {
    return UnmodifiableListView(_items);
  }

  Future<String> toggleItem(String id) async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final body = jsonEncode({"prodId": id});
      final res =
          await http.post('$URI/favourites', body: body, headers: headers);
      final result = jsonDecode(res.body);
      print(result);
      if (result["sucess"] == "sucess") return result["msg"];

      notifyListeners();
      return "Failed";
    } catch (err) {
      return "Failed";
    }
  }

  Future<void> fetchAndSetCart() async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final res = await http.get('$URI/cart', headers: headers);
      final result = jsonDecode(res.body) as List<dynamic>;
      List<Cart> loadedItems = [];
      result.forEach((element) {
        loadedItems.add(Cart(
            title: element["prodId"]["title"],
            price: element["prodId"]["price"],
            size: element["size"],
            id: element["_id"],
            img: element["prodId"]["images"][0],
            qty: 2));
      });
      _items = loadedItems;

      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  void updateCart(String id, String type) {
    final index = _items.indexWhere((element) => element.id == id);
    if (type == 'decrement')
      _items[index].qty--;
    else if (type == 'increment') _items[index].qty++;
    notifyListeners();
  }

  Future<void> delete(String id) async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final res = await http.delete('$URI/cart/$id', headers: headers);
      final result = jsonDecode(res.body);
      _items.removeWhere((element) => element.id == id);
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  Future<bool> deleteAll() async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final res = await http.delete('$URI/cart', headers: headers);
      final result = jsonDecode(res.body);
      _items.clear();
      notifyListeners();
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  int get totalAmount {
    double sum = 0;
    _items.forEach((element) {
      sum += (element.price * element.qty);
    });
    return sum.toInt();
  }
}
