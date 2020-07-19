import 'package:admin/dashboard.dart';
import 'package:admin/helpers/Button.dart';
import 'package:admin/helpers/Images.dart';
import 'package:admin/helpers/colors.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

class DeletedPage extends StatelessWidget {
  static const routeName = '/deleted-page';
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
              'Deleted',
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
          ),
          backgroundColor: Colors.white,
          bottomSheet: Container(
            padding: EdgeInsets.all(10),
            height: height * 0.1,
            color: Colors.white,
            child: Align(
              child: buildButton(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Dashboard.routeName, (route) => false);
                  },
                  width: width * 0.7,
                  text: 'Continue',
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
                      animation: "success",
                    )),
              ),
              Text(
                "Hurray!",
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
                  "Product is Deleted across all the devices",
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
