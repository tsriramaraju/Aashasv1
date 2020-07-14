import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopDetailsCard extends StatelessWidget {
  const ShopDetailsCard({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.pin_drop,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Address',
                        style: GoogleFonts.roboto(
                          color: Color(KOTPButtonBGColor),
                          fontSize: 22,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '\nHouse #2, Road #10,\nJubillie Hills, \nHyderabad.',
                              style: GoogleFonts.roboto(
                                color:
                                    Color(KOTPButtonBGColor).withOpacity(0.6),
                                fontSize: 14,
                              )),
                        ]),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(FontAwesomeIcons.clock, color: Colors.grey),
                  SizedBox(
                    width: 15,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Timmings',
                        style: GoogleFonts.roboto(
                          color: Color(KOTPButtonBGColor),
                          fontSize: 22,
                        ),
                        children: [
                          TextSpan(
                              text: '\nMonday - Friday\nOpen till 7PM',
                              style: GoogleFonts.roboto(
                                color:
                                    Color(KOTPButtonBGColor).withOpacity(0.6),
                                fontSize: 14,
                              )),
                        ]),
                  ),
                ],
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/other/map.png',
              fit: BoxFit.cover,
              width: width * 0.45,
              height: height * 0.35,
            ),
          )
        ],
      ),
    );
  }
}
