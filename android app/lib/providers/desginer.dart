import 'dart:convert';

import 'package:aashas/helpers/constants/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Designer with ChangeNotifier {
  String _name;
  String _bio;
  String _image;
  List<Map<String, String>> _blogs;

  String get name {
    return _name;
  }

  String get bio {
    return _bio;
  }

  String get image {
    return _image;
  }

  List<Map> get blogs {
    return _blogs;
  }

  Future<void> fetchAndSetDesigner() async {
    try {
      final headers = {"content-type": "application/json"};
      final res = await http.get('$URI/designer', headers: headers);
      final result = jsonDecode(res.body);
      _bio = result["bio"];
      _name = result["name"];
      _image = result["image"];
      final List<Map<String, String>> loadedBlogs = [];
      result["blogs"].forEach((element) {
        loadedBlogs.add({
          "title": element["title"],
          "content": element["content"],
          "slug": element["slug"],
          "image": element["image"],
        });
      });
      _blogs = loadedBlogs;
      _blogs.forEach((element) {
        print(element["title"]);
      });
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
}
