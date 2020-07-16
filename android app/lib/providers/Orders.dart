import 'dart:convert';

import 'package:aashas/helpers/constants/variables.dart';
import 'package:aashas/models/cart-model.dart';
import 'package:aashas/models/order-model.dart';
import 'package:aashas/models/product-model.dart';
import 'package:aashas/providers/Users.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Orders with ChangeNotifier {
  final Users user;
  Orders(this.user);
  List<Order> _items = [];

  Future<void> addOrder(
      {int mobile,
      String note,
      String email,
      String home,
      String address,
      int pinCode,
      String city,
      String state,
      String country,
      int total,
      int shipping,
      List<Cart> items,
      int finalAmount}) async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final List<Map<String, dynamic>> cartItems = [];
      items.forEach((e) => cartItems.add({
            "title": e.title,
            "size": [e.size],
            "price": e.price,
            "color": [e.color],
            "images": [e.img]
          }));
//      print(cartItems);
      final body = jsonEncode({
        "items": [...cartItems],
        "payment": {"status": "done", "method": "card"},
        "mobile": mobile,
        "note": note,
        "status": "Order Placed",
        "estDelivery": DateTime.now().add(Duration(days: 15)).toIso8601String(),
        "address": {
          "name": "Home",
          "house": home,
          "location": address,
          "street": "street name",
          "pin": pinCode,
          "city": city,
          "state": state
        },
        "orderedDate": DateTime.now().toIso8601String(),
        "price": {
          "productTotal": total,
          "tax": "18",
          "shippingCharges": shipping,
          "totalAmount": finalAmount
        },
      });

      final res = await http.post('$URI/orders', body: body, headers: headers);
      final result = jsonDecode(res.body);
      print(result);
    } catch (err) {
      print(err);
    }
  }
}
