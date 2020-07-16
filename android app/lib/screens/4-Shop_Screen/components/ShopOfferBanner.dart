import 'package:aashas/models/salesBanner.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../ShopPage.dart';
import 'CarouselItems.dart';

class ShopOfferBanner extends StatelessWidget {
  const ShopOfferBanner({Key key, @required this.widget, this.banner})
      : super(key: key);

  final ShopPage widget;
  final List<SalesBanner> banner;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.41,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/stock/14.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          SizedBox(
            height: widget.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: widget.onMenuPressed,
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.white),
                      onPressed: widget.onFavouritesPressed),
                  IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.white),
                      onPressed: widget.onCartPressed)
                ],
              )
            ],
          ),
          SizedBox(
            height: widget.height * 0.010,
          ),
          CarouselSlider(
            items: [
              ...banner.map((e) => ShopCarouselItems(
                    widget: widget,
                    title: e.title,
                    offer: e.discount,
                    description: 'Spring Collection',
                  )),
            ],
            options: CarouselOptions(
                enableInfiniteScroll: true,

//              autoPlay: true,
                viewportFraction: 0.99,
//              autoPlayInterval: Duration(seconds: 6),
//              autoPlayAnimationDuration: Duration(milliseconds: 800),
//              autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                height: 170
//                  widget.height * .235,
                ),
          )
        ],
      ),
    );
  }
}
