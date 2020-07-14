import 'package:aashas/components/Button.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ShopPage.dart';

class ShopCarouselItems extends StatelessWidget {
  const ShopCarouselItems({
    Key key,
    this.offer,
    this.description,
    this.title,
    @required this.widget,
  }) : super(key: key);

  final ShopPage widget;
  final String title;
  final String offer;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: widget.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                  color: Colors.white, fontSize: widget.height * 0.02),
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: Colors.white70,
              endIndent: widget.width * 0.7,
              indent: 5,
            ),
            Text(
              offer,
              style: GoogleFonts.roboto(
                fontSize: widget.height * 0.045,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              description,
              style: GoogleFonts.roboto(
                fontSize: widget.height * 0.015,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: widget.height * 0.02,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: buildButton(
                  height: 40,
                  fontSize: 15,
                  elevation: false,
                  textColor: KDrawerTextColor,
                  width: widget.width * .30,
                  text: 'shop now',
                  bgColor: KOTPButtonBGColor),
            )
          ],
        ),
      ),
    );
  }
}
