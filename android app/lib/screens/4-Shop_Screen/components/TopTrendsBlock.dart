import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/models/product-model.dart';
import 'package:aashas/providers/Products_Provider.dart';
import 'package:aashas/screens/4-Shop_Screen/components/ProductGridTileRectangle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopTrendsBlock extends StatelessWidget {
  TopTrendsBlock(
      {@required this.height,
      @required this.width,
      @required this.items,
      this.onCartPressed,
      this.onFavouritePressed,
      this.showAllProducts});
  final double height;
  final Function onFavouritePressed;
  final Function onCartPressed;
  final double width;
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
                'Top Trends',
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
        SizedBox(
          height: 5,
        ),
        Container(
          height: height * 0.15,
          child: GridView(
            padding: EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1 / 2.1),
            physics: BouncingScrollPhysics(),
            children: [
              ...items.map((index) {
                return ProductGridTileRectangle(
                  onCartPressed: onCartPressed,
                  onFavouritePressed: onFavouritePressed,
                  height: height,
                  width: width,
                  title: index.name,
                  id: index.id,
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
