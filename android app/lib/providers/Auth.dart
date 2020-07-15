import 'package:flutter/cupertino.dart';

class Auth with ChangeNotifier {
  String _token;

  String get token {
    return _token;
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }
}
