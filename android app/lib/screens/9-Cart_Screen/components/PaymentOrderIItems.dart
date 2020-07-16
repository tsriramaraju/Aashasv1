import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentOrderItemsCard extends StatelessWidget {
  const PaymentOrderItemsCard(
      {Key key,
      @required this.height,
      @required this.width,
      this.price,
      this.color,
      this.size,
      this.title,
      this.img})
      : super(key: key);

  final double height;
  final double width;
  final double price;
  final String title;
  final String size;
  final String color;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.25,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    img,
                    width: width * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.raleway(
                            color: Color(KOTPButtonBGColor),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Size: $size | Color:$color ',
                        style: GoogleFonts.raleway(
                            color: Color(KOTPButtonBGColor).withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Container(
                        height: height * 0.035,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: Colors.deepPurple, width: 1.5)),
                        alignment: Alignment.center,
                        child: Text(
                          '\$ $price',
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurple),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(
              height: 20,
              color: Colors.grey[300],
              thickness: 1,
            ),
          ],
        ));
  }
}
