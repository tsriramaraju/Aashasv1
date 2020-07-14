import 'dart:collection';

import 'package:aashas/models/product-model.dart';
import 'package:flutter/widgets.dart';

class Products with ChangeNotifier {
  List<Product> _products = [
    Product(
        designerCollection: true,
        size: ['XS', 'S', 'M', 'L', 'XL'],
        category: {
          'male': ['wedding', 'kurta']
        },
        description:
            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
        id: 'p1',
        images: [
          'assets/images/manyavar/alia.jpg',
          'assets/images/manyavar/alia.jpg',
          'assets/images/manyavar/alia.jpg',
          'assets/images/manyavar/alia.jpg'
        ],
        isFavourite: true,
        name: 'Male - wedding , Kurta',
        isNew: true,
        price: 26.5),
    Product(
        description:
            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
        size: ['XS', 'M', 'L', 'XL'],
        category: {
          'male': ['kurta']
        },
        id: 'p2',
        images: ['assets/images/ashas/1.jpg'],
        isFavourite: true,
        isNew: true,
        name: 'male - kurta',
        price: 26.5),
    Product(
        trends: true,
        size: ['XS', 'S', 'L', 'XL'],
        category: {
          'male': ['accessories']
        },
        description:
            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
        id: 'p3',
        images: ['assets/images/ashas/2.jpg'],
        isFavourite: false,
        name: 'male - accessories',
        price: 26.5),
    Product(
        size: ['XS', 'S', 'M', 'L', 'XL'],
        category: {
          'male': ['party wear']
        },
        description:
            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
        id: 'p4',
        images: ['assets/images/ashas/3.jpg'],
        isFavourite: false,
        name: 'male - party wear',
        price: 26.5),
    Product(
        size: ['XS', 'S', 'M', 'L', 'XL'],
        category: {
          'female': ['wedding']
        },
        description:
            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
        id: 'p5',
        images: ['assets/images/ashas/4.jpg'],
        isFavourite: false,
        name: 'female - wedding',
        price: 26.5),
    Product(
        size: ['XS', 'S', 'M', 'L', 'XL'],
        category: {
          'female': ['party wear']
        },
        description:
            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
        id: 'p6',
        images: ['assets/images/manyavar/1.jpg'],
        isFavourite: false,
        name: 'female - party wear',
        price: 26.5),
    Product(
        size: ['XS', 'S', 'M', 'L', 'XL'],
        category: {
          'female': ['lehengas']
        },
        description:
            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
        id: 'p7',
        images: ['assets/images/stock/1.jpg'],
        isFavourite: false,
        name: 'female - lehenga',
        price: 26.5),
    Product(
        size: ['XS', 'S', 'M', 'L', 'XL'],
        category: {
          'female': ['blouse']
        },
        description:
            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
        id: 'p8',
        images: ['assets/images/stock/2.jpg'],
        isFavourite: false,
        name: 'female - blouse',
        price: 26.5),
    Product(
        size: ['XS', 'S', 'M', 'L', 'XL'],
        category: {
          'kids': ['party wear']
        },
        description:
            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
        id: 'p9',
        images: ['assets/images/stock/2.jpg'],
        isFavourite: false,
        name: 'kids - party wear',
        price: 26.5),
    Product(
        size: ['XS', 'S', 'M', 'L', 'XL'],
        category: {
          'kids': ['casuals']
        },
        description:
            'A story woven from the twines of Crimson petals dropping down from the roof on to an earthy wall – a beautiful sight captured at the dawn. A childhood memory.\nDesigner\'s love for bougainvillea and the childhood image has inspired this collection. Each design is an untold story and a hand crafted bridal, fusion and luxury pret wear. The hand painted flowers and twines have been translated into prints and zardozi embroidery creating a vintage look in layers. This is a bright, flary, fun collection ranging from pastel to dark colours.',
        id: 'p10',
        images: ['assets/images/stock/4.jpg'],
        isFavourite: false,
        name: 'Kids - casuals',
        price: 26.5),
  ];
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
