import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroTextBlock extends StatelessWidget {
  const HeroTextBlock({@required this.height, this.description, this.title});
  final String title;
  final String description;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
                color: Color(KHCSHeroTitleColor),
                fontSize: height * 0.04,
                fontWeight: FontWeight.w500),
          ),
          Text(
            description,
            style: GoogleFonts.roboto(
                color: Color(KHCSHeroDescriptionColor),
                fontSize: height * 0.020,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
