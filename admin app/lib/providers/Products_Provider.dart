import 'dart:collection';
import 'dart:convert';

import 'package:admin/helpers/variables.dart';
import 'package:admin/models/product-model.dart';
import 'package:admin/providers/Users.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/widgets.dart';

class Products with ChangeNotifier {
  final Users user;
  Products(this.user);
  List<Product> _products = [];

  Future<String> addProduct(Product productData) async {
    final headers = {
      "content-type": "application/json",
      'Authorization': 'Bearer ${user.token}'
    };
    final body = jsonEncode({
      "title": productData.name,
      "description": productData.description,
      "size": productData.size.join(" "),
      "price": productData.price + 0.00,
      "color": productData.colors.join(" "),
      "category": productData.category.keys.first,
      "sub": productData.category[productData.category.keys.first].join(" "),
      "images": productData.images.join(" "),
      "designerCollection": productData.designerCollection,
      "isNewProduct": productData.isNew,
      "trending": productData.trends,
    });
    try {
      final res =
          await http.post('$URI/products', body: body, headers: headers);
      final result = jsonDecode(res.body);
      print(result);
      return result["msg"];
    } catch (err) {
      print("error from provide $err");
      return err["msg"];
    }
  }

  Future<String> updateProduct(Product productData) async {
    final headers = {
      "content-type": "application/json",
      'Authorization': 'Bearer ${user.token}'
    };
    final body = jsonEncode({
      "title": productData.name,
      "description": productData.description,
      "size": productData.size.join(" "),
      "price": productData.price + 0.00,
      "color": productData.colors.join(" "),
      "category": productData.category.keys.first,
      "sub": productData.category[productData.category.keys.first].join(" "),
      "images": productData.images.join(" "),
      "designerCollection": productData.designerCollection,
      "isNewProduct": productData.isNew,
      "trending": productData.trends,
    });
    try {
      print("prod is ${productData.id}");
      final res = await http.put('$URI/products/${productData.id}',
          body: body, headers: headers);
      final result = jsonDecode(res.body);
      print(result);
      return result[0]["msg"];
    } catch (err) {
      print("error from provide $err");
      return err["msg"];
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final res = await http.delete('$URI/products/${id}', headers: headers);
      final resbody = jsonDecode(res.body);
      print(resbody);
    } catch (err) {
      print(err);
    }
  }

  Future<void> fetAndSetProducts() async {
    try {
      final headers = {"content-type": "application/json"};
//      final body = jsonEncode({});
      final res = await http.get('$URI/products', headers: headers);
      final result = jsonDecode(res.body) as List<dynamic>;
      final List<Product> loadedProducts = [];
      result.forEach((element) {
        List<String> sub = [];
        List<String> images = [];
        List<String> size = [];
        element["images"].forEach((img) => images.add(img));
        element["size"].forEach((siz) => size.add(siz));

        element["category"]["sub"].forEach((subCat) => {sub.add(subCat)});
        loadedProducts.add(Product(
            description: element["description"],
            id: element["_id"],
            images: images,
            size: size,
            price: element["price"],
            name: element["title"],
            trends: element["trending"],
            isNew: element["isNewProduct"],
            isFavourite: element["isFavourite"],
            designerCollection: element["desginerCollection"],
            category: {element["category"]["main"]: sub}));

//        print(element["images"]);
//        print(element["category"]["main"]);
//        print(sub);
      });

//      print(loadedProducts[0].category);
      _products = loadedProducts;
      _products.forEach((element) {
        print("products fetched");
      });
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  List<Product> get products {
    return UnmodifiableListView(_products);
  }

  List<Product> get designerProducts {
    return _products
        .where((element) => element.designerCollection == true)
        .toList();
  }

  List<Product> get topTrends {
    return _products.where((element) => element.trends == true).toList();
  }

  List<Product> filterProducts(String filter, {String subFilter}) {
    if (filter == null) return UnmodifiableListView(_products);
    final List<Product> items = [];
    _products.forEach((element) {
      element.category.forEach((key, value) {
        if (key == filter) {
          if (subFilter != null && value.contains(subFilter))
            items.add(element);
          else if (subFilter == null || subFilter == 'all') items.add(element);
        }
      });
    });

    return items;
  }
}
