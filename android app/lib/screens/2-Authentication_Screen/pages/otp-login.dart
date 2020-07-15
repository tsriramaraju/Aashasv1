import 'package:aashas/components/Button.dart';
import 'package:aashas/drawerHome.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/text.dart';
import 'package:aashas/providers/Users.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OTPLoginScreen extends StatefulWidget {
  static const routeName = '/OTP-Login';
  @override
  _OTPLoginScreenState createState() => _OTPLoginScreenState();
}

class _OTPLoginScreenState extends State<OTPLoginScreen> {
  bool isLoading = false;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _handleSubmit(BuildContext context) async {
    final mobile = ModalRoute.of(context).settings.arguments;
    print(mobile);
    final user = Provider.of<Users>(context);
    setState(() {
      isLoading = true;
    });

    final res = await user.mobileLogin(mobile, int.parse(_otpController.text));
    setState(() {
      isLoading = false;
    });
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(res), duration: Duration(seconds: 3)));
    if (res == "Login success")
      Navigator.pushNamedAndRemoveUntil(
          context, DrawerHome.routeName, (route) => false);
  }

  void _handleResend(BuildContext context) async {
    final mobile = ModalRoute.of(context).settings.arguments;
    setState(() {
      isLoading = true;
    });
    final user = Provider.of<Users>(context);
    await user.generateOTP(number: mobile);
    setState(() {
      isLoading = false;
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("OTP Generated again"),
        duration: Duration(seconds: 3),
      ));
    });
  }

  TextEditingController _otpController;
  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
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
                controller: _otpController,
                pinTheme: PinTheme(
                  inactiveColor: Color(KOTPInactiveColor),
                  activeColor: Color(KOTPNumberColor).withOpacity(0.3),
                  selectedColor: Color(KOTPNumberColor).withOpacity(0.6),
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                ),
                length: 4,
                obsecureText: false,
                animationType: AnimationType.slide,
                animationDuration: Duration(milliseconds: 100),
                onChanged: (value) {},
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Center(
                  child: buildButton(
                onTap: () => _handleSubmit(context),
                loading: isLoading,
                width: width * .45,
                text: 'Verify',
                textColor: KOTPButtonTextColor,
                bgColor: KOTPButtonBGColor,
              )),
              SizedBox(
                height: height * 0.009,
              ),
              Center(
                child: GestureDetector(
                  onTap: () => _handleResend(context),
                  child: Text(
                    KOTPResendText,
                    style: GoogleFonts.roboto(
                      color: Color(KOTPFlatButtonTextColor).withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                    ),
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
