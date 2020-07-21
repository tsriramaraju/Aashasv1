import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignerAboutCard extends StatelessWidget {
  const DesignerAboutCard({Key key, @required this.height, this.bio})
      : super(key: key);

  final double height;
  final String bio;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (bio.length) * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: GoogleFonts.roboto(fontSize: 22),
          ),
          Text(
            bio,
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
