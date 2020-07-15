import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/styles.dart';
import 'package:aashas/screens/4-Shop_Screen/pages/ProductPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile(
      {this.height,
      this.price,
      this.width,
      this.id,
      this.img,
      this.isNew,
      this.isFavourite,
      this.onCartPressed,
      this.onFavouritePressed,
      this.title});

  final double height;
  final double width;
  final Function onFavouritePressed;
  final Function onCartPressed;
  final String img;
  final String id;
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
        decoration: KInputBox.copyWith(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * .32,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
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
                                  color: Color(KOTPButtonBGColor),
                                  borderRadius: BorderRadius.circular(25)),
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Text(
                                'New',
                                style: GoogleFonts.roboto(
                                    fontSize: 12, color: Colors.white),
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
              height: height * 0.01,
            ),
            Text(
              '   $title',
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              '     \$${price.toString()}',
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
//child: Row(
//children: [
//ClipRRect(
//borderRadius: BorderRadius.circular(5),
//child: Image.asset(
//img,
//fit: BoxFit.cover,
//),
//),
//Expanded(
//child: Column(
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.start,
//children: [

//SizedBox(
//height: height * 0.04,
//),
//],
//))
//],
//),
