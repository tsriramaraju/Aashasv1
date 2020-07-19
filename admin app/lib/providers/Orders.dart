import 'dart:convert';

import 'package:admin/helpers/variables.dart';
import 'package:admin/models/order-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'Users.dart';

class Orders with ChangeNotifier {
  final Users user;
  Orders(this.user);
  List<Order> _items = [];

  Future<void> fetchAndSetOrders() async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final res = await http.get('$URI/orders', headers: headers);
      final result = jsonDecode(res.body);
      print(result[0]["price"]["totalAmount"]);
      final List<Order> loadedOrders = [];
      result.forEach((e) => {
            loadedOrders.add(Order(
                id: e["_id"],
                mobile: e["mobile"],
                img: e["items"][0]["images"][0],
//              items: e["items"] as List<Map<String, dynamic>>,
//              address: e["address"] as Map<String, Map<String, String>>,
                estDelivery: DateTime.parse(e["estDelivery"]),
                orderedData: DateTime.parse(e["orderedDate"]),
                status: e["status"],
                price: e["price"]["totalAmount"]
//              payment: e["payment"] as Map<String, Map<String, String>>,
                ))
          });
      _items = loadedOrders;

      print(result);
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  List<Order> get orders {
    return [..._items];
  }

  Future<void> updateStatus(String id, String status) async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final body = jsonEncode({"status": status});
      final res = await http.put('$URI/orders/$id',body: body, headers: headers);
      final result = jsonDecode(res.body);
      print(result);
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
}
