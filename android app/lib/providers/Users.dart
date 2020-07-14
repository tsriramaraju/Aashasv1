import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  Future<bool> setUserDetails(
      String name, String email, String password) async {
    try {
      final body = jsonEncode({
        "email": email,
      });
      final headers = {"content-type": "application/json"};
      final result = await http.post('$URI/users/check-email',
          body: body, headers: headers);
      final resData = jsonDecode(result.body);
//      print(resData);
      if (resData['msg'] == "sucess") return false;
      _name = name;
      _email = email;
      _password = password;
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> setUserMobile(int mobile) async {
    try {
      final body = jsonEncode({
        "mobile": mobile,
      });
      final headers = {"content-type": "application/json"};
      final result = await http.post('$URI/users/check-mobile',
          body: body, headers: headers);
      final resData = jsonDecode(result.body);

      if (resData['msg'] == "sucess") return false;
      _mobile = mobile;
      final mobBody = jsonEncode({"mobile": _mobile.toInt()});
      final mobHeaders = {"content-type": "application/json"};
      print(jsonDecode(body));
      final mobResult = await http.post('$URI/otp/generate',
          body: mobBody, headers: mobHeaders);
      print(jsonDecode(mobResult.body));
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<String> verifyOTP(int otp) async {
    try {
      final body = jsonEncode({
        "mobile": _mobile,
        "otp": otp,
        "name": _name,
        "email": _email,
        "password": _password
      });
      final headers = {"content-type": "application/json"};
      final result =
          await http.post('$URI/users/register', body: body, headers: headers);
      final resData = jsonDecode(result.body);
      print(resData);

      if (resData['msg'] == "User successfuly registered") return "Success";
      if (resData['msg'] == "OTP Expired") return "OTP Expired";
      print(resData);
      return "Invalid OTP";
    } catch (err) {
      print(err);
      return "Some error on server, plz try later";
    }
  }
}
