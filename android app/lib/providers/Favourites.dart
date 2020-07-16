import 'dart:collection';
import 'dart:convert';
import 'package:aashas/helpers/constants/variables.dart';
import 'package:aashas/models/Favourites-model.dart';
import 'package:aashas/models/product-model.dart';
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
      await fetchAndSetFavourites();
      if (result["msg"] == "Favourite  removed") return "Favourite  removed";
      if (result["msg"] == "Favourites added suceffully")
        return "Favourites added suceffully";

      notifyListeners();
      return "Failed";
    } catch (err) {
      return "Failed";
    }
  }

  Future<void> fetchAndSetFavourites() async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final res = await http.get('$URI/favourites', headers: headers);
      final result = jsonDecode(res.body) as List<dynamic>;
      List<Favourite> loadedItems = [];
      result.forEach((element) {
        loadedItems.add(Favourite(
            title: element["prodId"]["title"],
            price: element["prodId"]["price"],
            prodId: element["prodId"]["_id"],
            size: "XL",
            id: element["_id"],
            img: element["prodId"]["images"][0],
            color: element["prodId"]["color"][0]));
      });
      _items = loadedItems;

      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  bool isFav(String id) {
    bool val = false;
    if (_items == []) return val;
    _items.forEach((element) {
      if (id == element.prodId) val = true;
    });
    return val;
  }

  int favCount() {
    return _items.length;
  }
}
