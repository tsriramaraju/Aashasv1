import 'package:aashas/screens/4-Shop_Screen/pages/ProductPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductGridTileSquare extends StatelessWidget {
  const ProductGridTileSquare(
      {this.height,
      this.price,
      this.width,
      this.img,
      this.onCartPressed,
      this.onFavouritePressed,
      this.isNew,
      this.isFavourite,
      this.title,
      this.id});

  final double height;
  final double width;
  final Function onFavouritePressed;
  final Function onCartPressed;
  final String img;
  final String title;
  final bool isNew;
  final bool isFavourite;
  final double price;
  final String id;
  void showProduct(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductPage(
            id: id,
            onCartPressed: onCartPressed,
            onFavouritesPressed: onFavouritePressed,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showProduct(context),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .265,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 2,
                    top: 5,
                    child: Align(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            icon: Icon(
                              isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                              size: 14,
                            ),
                            onPressed: () {}),
                      ),
                    ),
                  ),
                  isNew
                      ? Positioned(
                          left: 5,
                          bottom: 5,
                          child: Align(
                            child: Container(
                              height: height * 0.03,
                              width: width * 0.12,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Text(
                                'New',
                                style: GoogleFonts.roboto(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        )
                      : Text('')
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '   $title',
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '    \$${price.toString()}',
              style: GoogleFonts.roboto(
                fontSize: 10,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
