import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/text.dart';
import 'package:aashas/screens/4-Shop_Screen/pages/ProductPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductGridTileRectangle extends StatelessWidget {
  const ProductGridTileRectangle(
      {this.height,
      this.price,
      this.id,
      this.width,
      this.onCartPressed,
      this.onFavouritePressed,
      this.img,
      this.isNew,
      this.isFavourite,
      this.title});

  final double height;
  final String id;
  final double width;
  final Function onFavouritePressed;
  final Function onCartPressed;
  final String img;
  final String title;
  final bool isNew;
  final bool isFavourite;
  final double price;
  void showProduct(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductPage(
            id: id,
            onFavouritesPressed: onFavouritePressed,
            onCartPressed: onCartPressed,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showProduct(context),
      child: Container(
//      color: Colors.blueGrey,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  '\$${price.toString()}',
                  style: GoogleFonts.roboto(
                      fontSize: height * 0.020,
                      fontWeight: FontWeight.w400,
                      color: Color(KCSTitleColor).withOpacity(.7)),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
