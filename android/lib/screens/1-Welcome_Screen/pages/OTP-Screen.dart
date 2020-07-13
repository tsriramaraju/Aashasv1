import 'package:aashas/components/Button.dart';
import 'package:aashas/drawerHome.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  static const routeName = '/OTP-Screen';
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  void _handleSubmit(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, DrawerHome.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData().copyWith(color: Colors.black),
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
                KOTPTitleText,
                style: GoogleFonts.arvo(
                  fontSize: height * 0.035,
                  color: Color(KOTPTitleColor),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Text(
                KOTPDescriptionText,
                style: GoogleFonts.roboto(
                  fontSize: height * 0.015,
                  color: Color(KOTPDescriptionColor).withOpacity(0.6),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              PinCodeTextField(
                inactiveColor: Color(KOTPInactiveColor),
                activeColor: Color(KOTPNumberColor).withOpacity(0.3),
                selectedColor: Color(KOTPNumberColor).withOpacity(0.6),
                length: 4,
                obsecureText: false,
                animationType: AnimationType.slide,
                shape: PinCodeFieldShape.box,
                animationDuration: Duration(milliseconds: 100),
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                onChanged: (value) {},
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Center(
                  child: buildButton(
                onTap: () => _handleSubmit(context),
                width: width * .45,
                text: 'Verify',
                textColor: KOTPButtonTextColor,
                bgColor: KOTPButtonBGColor,
              )),
              SizedBox(
                height: height * 0.009,
              ),
              Center(
                child: Text(
                  KOTPResendText,
                  style: GoogleFonts.roboto(
                    color: Color(KOTPFlatButtonTextColor).withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
