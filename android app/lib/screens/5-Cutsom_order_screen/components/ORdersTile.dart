import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderItemTile extends StatelessWidget {
  const OrderItemTile(
      {Key key,
      @required this.height,
      @required this.width,
      this.img,
      this.price,
      this.status,
      this.estDays})
      : super(key: key);

  final double height;
  final double width;
  final String img;

  final String estDays;
  final String status;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
//        height: height * 0.3,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '\$$price',
                    style: GoogleFonts.roboto(
                        color: Color(KOTPButtonBGColor).withOpacity(0.75),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'delivering in $estDays Days',
                    style: GoogleFonts.raleway(
                        color: Color(KOTPButtonBGColor).withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      height: height * 0.045,
                      width: width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.green, width: 1.5)),
                      alignment: Alignment.center,
                      child: Text(
                        status,
                        style: GoogleFonts.raleway(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Divider(
          height: 40,
          color: Colors.grey[300],
          thickness: 1.5,
        )
      ],
    ));
  }
}
