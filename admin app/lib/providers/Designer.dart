import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:admin/helpers/variables.dart';
import 'package:admin/providers/Users.dart';
import 'package:flutter/cupertino.dart';

class Designer with ChangeNotifier {
  final Users user;
  Designer(this.user);
  String _name;
  String _email;
  String _bio;
  String _img;
  int _mobile;

  String get name {
    return _name;
  }

  String get email {
    return _email;
  }

  String get bio {
    return _bio;
  }

  String get img {
    return _img;
  }

  int get mobile {
    return _mobile;
  }

  Future<void> fetchAndSetDesigner() async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final res = await http.get('$URI/designer', headers: headers);
      final result = jsonDecode(res.body);
      _mobile = result["mobile"];
      _email = result["email"];
      _name = result["name"];
      _bio = result["bio"];
      _img = result["image"];
      notifyListeners();
      print(result);
    } catch (err) {
      print(err);
    }
  }

  Future<String> updateDesigner(Map<String, dynamic> data) async {
    try {
      final headers = {
        "content-type": "application/json",
        'Authorization': 'Bearer ${user.token}'
      };
      final body = jsonEncode({
        "name": data["name"],
        "email": data["email"],
        "mobile": data["mobile"],
        "image": data["img"],
        "bio": data["bio"],
      });
      final res = await http.put('$URI/designer', body: body, headers: headers);
      final result = jsonDecode(res.body);
      return result["msg"];
    } catch (err) {
      print(err);
    }
  }
}
