import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import '../helpers/constants/variables.dart';

class Users with ChangeNotifier {
  String _id;
  String _name;
  String _email;
  String _password;
  int _mobile;
  bool _isAdmin;
  List<Map<String, String>> _address;
  List<Object> _orders;
  List<Object> _favourite;
  List<Object> _customProducts;
  DateTime _date;

  void setUserDetails(String name, String email, String password) {
    _name = name;
    _email = email;
    _password = password;
    print('$_password + $_email + $_name'
        '');
  }

  Future<void> setUserMobile(int mobile) async {
    _mobile = mobile;
    print('$_password + $_email + $_name +$_mobile');
    final body = jsonEncode({"mobile": _mobile.toInt()});
    print(jsonDecode(body));
    final result = await http.post(
      '$URI/otp/generate',
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'creatorId': userId,
      }),
    );
    print(jsonDecode(result.body));
  }
}
