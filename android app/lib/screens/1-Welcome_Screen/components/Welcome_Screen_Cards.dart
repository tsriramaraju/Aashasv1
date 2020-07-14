import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreenCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageAddress;
  WelcomeScreenCard({this.description, this.imageAddress, this.title});
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final bool tab = width > 700;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.arvo(
              fontSize: tab ? 50 : 24,
              color: Color(KWSTitleColor),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          ConstrainedBox(
            child: Text(
              description,
              style: GoogleFonts.titilliumWeb(
                  fontSize: tab ? 26 : 14,
                  color: Color(KWSDescriptionColor),
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            constraints: BoxConstraints(maxWidth: width * 0.6),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Container(
            height: height * .45,
            width: width * .7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: new Offset(0, height * 0.025),
                      blurRadius: 10,
                      spreadRadius: 0.1),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              child: Image.asset(
                imageAddress,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
