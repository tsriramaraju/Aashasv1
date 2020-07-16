import 'package:aashas/components/Button.dart';
import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/main-home.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../drawerHome.dart';

class FailedPage extends StatelessWidget {
  static const routeName = '/failed-page';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.dark.copyWith();
    return AnnotatedRegion(
        value: _currentStyle,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Checkout',
              style: GoogleFonts.roboto(
                  color: Color(KOTPButtonBGColor),
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            ),
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Color(KOTPButtonBGColor),
            ),
            bottom: PreferredSize(
                child: Container(
                  height: height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(KOTPButtonBGColor),
                      ),
                      Text(
                        '. . . .',
                        style: GoogleFonts.roboto(
                          color: Color(KOTPButtonBGColor),
                          fontSize: 30,
                        ),
                      ),
                      Icon(
                        Icons.credit_card,
                        color: Color(KOTPButtonBGColor),
                      ),
                      Text(
                        '. . . .',
                        style: GoogleFonts.roboto(
                            color: Color(KOTPButtonBGColor).withOpacity(0.5),
                            fontSize: 30),
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Color(KOTPButtonBGColor).withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(height * 0.08)),
          ),
          bottomSheet: Container(
            padding: EdgeInsets.all(10),
            height: height * 0.1,
            color: Colors.white,
            child: Align(
              child: buildButton(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, DrawerHome.routeName),
                  width: width * 0.7,
                  text: 'Continue Shopping',
                  bgColor: KOTPButtonBGColor,
                  textColor: KHCSButtonTextColor),
            ),
          ),
          body: Column(
            children: [
              Align(
                child: Container(
                  height: height * 0.45,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[100],
                  ),
                  child: FlareActor(
                    TEDDY,
                    animation: "fail",
                  ),
                ),
              ),
              Text(
                "Payment Failed!",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    color: Color(KOTPButtonBGColor),
                    fontSize: 35),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: width * 0.7),
                child: Text(
                  "Incase of transaction failure, the amount will be refunded in 1-7 business days",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      color: Color(KOTPButtonBGColor).withOpacity(0.6),
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ));
  }
}
