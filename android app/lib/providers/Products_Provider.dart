import 'dart:collection';
import 'dart:convert';
import 'package:aashas/helpers/constants/variables.dart';
import 'package:http/http.dart' as http;
import 'package:aashas/models/product-model.dart';
import 'package:flutter/widgets.dart';

class Products with ChangeNotifier {
  List<Product> _products = [
//    Product(
//        designerCollection: true,
//        size: ['XS', 'S', 'M', 'L', 'XL'],
//        category: {
//          'male': ['wedding', 'kurta']
//        },
//        description:
//            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
//        id: 'p1',
//        images: [
//          'assets/images/manyavar/alia.jpg',
//          'assets/images/manyavar/alia.jpg',
//          'assets/images/manyavar/alia.jpg',
//          'assets/images/manyavar/alia.jpg'
//        ],
//        isFavourite: true,
//        name: 'Male - wedding , Kurta',
//        isNew: true,
//        price: 26.5),
//    Product(
//        description:
//            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
//        size: ['XS', 'M', 'L', 'XL'],
//        category: {
//          'male': ['kurta']
//        },
//        id: 'p2',
//        images: ['assets/images/ashas/1.jpg'],
//        isFavourite: true,
//        isNew: true,
//        name: 'male - kurta',
//        price: 26.5),
//    Product(
//        trends: true,
//        size: ['XS', 'S', 'L', 'XL'],
//        category: {
//          'male': ['accessories']
//        },
//        description:
//            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
//        id: 'p3',
//        images: ['assets/images/ashas/2.jpg'],
//        isFavourite: false,
//        name: 'male - accessories',
//        price: 26.5),
//    Product(
//        size: ['XS', 'S', 'M', 'L', 'XL'],
//        category: {
//          'male': ['party wear']
//        },
//        description:
//            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
//        id: 'p4',
//        images: ['assets/images/ashas/3.jpg'],
//        isFavourite: false,
//        name: 'male - party wear',
//        price: 26.5),
//    Product(
//        size: ['XS', 'S', 'M', 'L', 'XL'],
//        category: {
//          'female': ['wedding']
//        },
//        description:
//            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
//        id: 'p5',
//        images: ['assets/images/ashas/4.jpg'],
//        isFavourite: false,
//        name: 'female - wedding',
//        price: 26.5),
//    Product(
//        size: ['XS', 'S', 'M', 'L', 'XL'],
//        category: {
//          'female': ['party wear']
//        },
//        description:
//            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
//        id: 'p6',
//        images: ['assets/images/manyavar/1.jpg'],
//        isFavourite: false,
//        name: 'female - party wear',
//        price: 26.5),
//    Product(
//        size: ['XS', 'S', 'M', 'L', 'XL'],
//        category: {
//          'female': ['lehengas']
//        },
//        description:
//            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
//        id: 'p7',
//        images: ['assets/images/stock/1.jpg'],
//        isFavourite: false,
//        name: 'female - lehenga',
//        price: 26.5),
//    Product(
//        size: ['XS', 'S', 'M', 'L', 'XL'],
//        category: {
//          'female': ['blouse']
//        },
//        description:
//            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
//        id: 'p8',
//        images: ['assets/images/stock/2.jpg'],
//        isFavourite: false,
//        name: 'female - blouse',
//        price: 26.5),
//    Product(
//        size: ['XS', 'S', 'M', 'L', 'XL'],
//        category: {
//          'kids': ['party wear']
//        },
//        description:
//            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
//        id: 'p9',
//        images: ['assets/images/stock/2.jpg'],
//        isFavourite: false,
//        name: 'kids - party wear',
//        price: 26.5),
//    Product(
//        size: ['XS', 'S', 'M', 'L', 'XL'],
//        category: {
//          'kids': ['casuals']
//        },
//        description:
//            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
//        id: 'p10',
//        images: ['assets/images/stock/4.jpg'],
//        isFavourite: false,
//        name: 'Kids - casuals',
//        price: 26.5),
  ];

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
        print(element.images);
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
