import 'package:aashas/components/Button.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mobile-Registration.dart';

class NameRegistrationScreen extends StatelessWidget {
  static const routeName = '/Name-Registration-Screen';
  void _handleSubmit(BuildContext context) {
    Navigator.pushNamed(context, MobileRegistrationScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(KNRSBGColor),
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData().copyWith(color: Color(KNRSButtonBGColor)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: height * 0.06,
              ),
              Text(
                KNRSTitleText,
                style: GoogleFonts.arvo(
                  fontSize: height * 0.035,
                  color: Color(KNRSTitleColor),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Text(
                KNRSDescriptionText,
                style: GoogleFonts.roboto(
                  fontSize: height * 0.015,
                  color: Color(KNRSDescriptionColor).withOpacity(0.6),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'name',
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    FontAwesomeIcons.user,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Center(
                  child: buildButton(
                      bgColor: KNRSButtonBGColor,
                      text: 'Next',
                      width: width * .45,
                      textColor: KNRSButtonTextColor,
                      onTap: () => _handleSubmit(context))),
            ],
          ),
        ),
      ),
    );
  }
}
