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

  Future<bool> addOrder(
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
        }
      });

      final res =
          await http.post('$URI/orders', body: (body), headers: headers);
      final result = jsonDecode(res.body);

      notifyListeners();
      if (result["_id"].length > 0) return true;
      return false;
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future<void> fetchAndSetOrders() async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final res = await http.get('$URI/orders/get', headers: headers);
      final result = jsonDecode(res.body);
      print(result[0]["mobile"]);
      final List<Order> loadedOrders = [];

      result.forEach((e) => {
            loadedOrders.add(Order(
                mobile: e["mobile"],
                // img: e["items"].first["images"].first,
                img: e["items"].first["images"].first,
//              items: e["items"] as List<Map<String, dynamic>>,
//              address: e["address"] as Map<String, Map<String, String>>,
                estDelivery: DateTime.parse(e["estDelivery"]),
                orderedData: DateTime.parse(e["orderedDate"]),
                status: e["status"],
                price: e["price"]["totalAmount"]
//              payment: e["payment"] as Map<String, Map<String, String>>,
                ))
          });
      print("loaded orders $loadedOrders \n\n\\n\n\n\n");
      _items = loadedOrders;

      print("orders are $result");
      notifyListeners();
    } catch (err) {
      print("order page error $err");
    }
  }
//   Future<void> fetchAndSetOrders() async {
//     try {
//       final headers = {
//         "content-type": "application/json",
//         'Authorization': 'Bearer ${user.token}'
//       };
//       final res = await http.get('$URI/orders/get', headers: headers);
//       final result = jsonDecode(res.body);
//       // print(result[0]["price"]["totalAmount"]);
//       final List<Order> loadedOrders = [];
//       result.forEach((e) => {
//             loadedOrders.add(Order(
//                 mobile: e["mobile"],
//                 img: e["items"][0]["images"][0],
// //              items: e["items"] as List<Map<String, dynamic>>,
// //              address: e["address"] as Map<String, Map<String, String>>,
//                 estDelivery: DateTime.parse(e["estDelivery"]),
//                 orderedData: DateTime.parse(e["orderedDate"]),
//                 status: e["status"],
//                 price: e["price"]["totalAmount"]
// //              payment: e["payment"] as Map<String, Map<String, String>>,
//                 ))
//           });
//       _items = loadedOrders;
//       print("orders fetch and set called $result");
//       print("orders fetch and set called ${_items}");
//       print("orders fetch and set called $loadedOrders");

//       notifyListeners();
//     } catch (err) {
//       print(err);
//     }
//   }

  List<Order> get orders {
    return [..._items];
  }
}
