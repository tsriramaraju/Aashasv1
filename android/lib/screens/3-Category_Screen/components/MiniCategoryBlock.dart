import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiniCategoryBlock extends StatelessWidget {
  const MiniCategoryBlock(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.title,
      @required this.image,
      this.onTap})
      : super(key: key);
  final Function onTap;
  final double width;
  final double height;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.4,
        height: height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: GoogleFonts.roboto(
                    color: Color(KHCSMiniCardsTextColor),
                    fontSize: height * 0.026,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
