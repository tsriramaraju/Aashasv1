import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/models/product-model.dart';
import 'package:aashas/providers/Products_Provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ProductsTileSmall.dart';

class AllProductsBlock extends StatelessWidget {
  AllProductsBlock(
      {@required this.height,
      @required this.width,
      this.onCartPressed,
      this.onFavouritePressed,
      @required this.items,
      this.showAllProducts});
  final double height;
  final double width;
  final Function onFavouritePressed;
  final Function onCartPressed;
  final List<Product> items;
  final Function showAllProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Products',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.035,
                  color: Color(KCSTitleColor),
                ),
              ),
              FlatButton(
                child: Text(
                  'Show all',
                  style: GoogleFonts.roboto(
                      color: Color(KCSTitleColor).withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.017),
                ),
                onPressed: () => showAllProducts(context),
              )
            ],
          ),
        ),
        Container(
          height: height * 0.60,
          child: GridView(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5),
            physics: BouncingScrollPhysics(),
            children: [
              ...items.map((index) {
                return ProductsTile(
                  id: index.id,
                  onCartPressed: onCartPressed,
                  onFavouritePressed: onFavouritePressed,
                  height: height,
                  width: width,
                  title: index.name,
                  img: index.images[0],
                  isNew: index.isNew,
                  isFavourite: index.isFavourite,
                  price: index.price,
                );
              }).toList()
            ],
          ),
        )
      ],
    );
  }
}
