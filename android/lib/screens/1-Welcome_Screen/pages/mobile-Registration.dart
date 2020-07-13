import 'package:aashas/components/Button.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'OTP-Screen.dart';

class MobileRegistrationScreen extends StatelessWidget {
  static const routeName = '/mobile-registration';

  void _handleSubmit(BuildContext context) {
    Navigator.pushNamed(context, OTPScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(KMRSBGColor),
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData().copyWith(color: Color(KMRSButtonBGColor)),
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
                KMRSTitleText,
                style: GoogleFonts.arvo(
                  fontSize: height * 0.035,
                  color: Color(KMRSTitleColor),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Text(
                KMRSDescriptionText,
                style: GoogleFonts.roboto(
                  fontSize: height * 0.015,
                  color: Color(KMRSDescriptionColor).withOpacity(0.6),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'phone',
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    FontAwesomeIcons.mobileAlt,
                    color: Colors.black,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Center(
                  child: buildButton(
                      bgColor: KMRSButtonBGColor,
                      text: 'Send OTP',
                      textColor: KMRSButtonTextColor,
                      width: width * 0.65,
                      onTap: () => _handleSubmit(context))),
            ],
          ),
        ),
      ),
    );
  }
}
