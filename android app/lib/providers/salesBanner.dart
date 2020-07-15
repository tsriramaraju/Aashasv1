import 'dart:convert';

import 'package:aashas/helpers/constants/variables.dart';
import 'package:aashas/models/salesBanner.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class SalesBanners with ChangeNotifier {
  List<SalesBanner> _banners;

  List<SalesBanner> get banner {
    return [..._banners];
  }

  Future<void> fetchAndSetBanners() async {
    try {
      final headers = {"content-type": "application/json"};
      final res = await http.get('$URI/sales-banner', headers: headers);
      final result = jsonDecode(res.body) as List<dynamic>;
      final List<SalesBanner> loadedBanners = [];
      result.forEach((element) {
        loadedBanners.add(SalesBanner(
            title: element["title"], discount: element["discount"]));
      });

      _banners = loadedBanners;
//      _blogs.forEach((element) {
//        print(element["title"]);
//      });
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
}
