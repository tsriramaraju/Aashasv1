import 'package:aashas/models/product-model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCards extends StatelessWidget {
  const ProductCards({
    Key key,
    @required this.height,
    @required this.item,
    @required this.width,
  }) : super(key: key);

  final double height;
  final Product item;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.5,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
//
        children: [
          ...item.images.map((index) {
            return Row(
              children: [
                Stack(
                  fit: StackFit.loose,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        index,
                        width: width * 0.8,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: Align(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              icon: Icon(
                                item.isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                                size: 14,
                              ),
                              onPressed: () {}),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      bottom: 5,
                      child: Align(
                        child: Container(
                          height: height * 0.04,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          padding: EdgeInsets.symmetric(vertical: 0),
                          child: Text(
                            '\$${item.price.toString()}',
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                )
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
