import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignerAboutCard extends StatelessWidget {
  const DesignerAboutCard({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: GoogleFonts.roboto(fontSize: 22),
          ),
          Text(
            'Aasha\'s Tailoring has been been the offering the finest women\’s tailoring service for over 5 years. With access to the best fabrics and experienced Tailors, Aasha\’s can offer the very best of women\’s tailoring.',
            style: GoogleFonts.roboto(
                fontSize: 14,
                wordSpacing: 2,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                height: 1.25,
                color: Color(KOTPButtonBGColor).withOpacity(0.6)),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
