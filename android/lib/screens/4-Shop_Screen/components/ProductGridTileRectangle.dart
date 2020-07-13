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
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '   $title',
                  style: GoogleFonts.roboto(
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  '    \$${price.toString()}',
                  style: GoogleFonts.roboto(
                    fontSize: height * 0.020,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
