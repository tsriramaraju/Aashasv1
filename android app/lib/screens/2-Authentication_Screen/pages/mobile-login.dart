import 'package:aashas/components/Button.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/text.dart';
import 'package:aashas/providers/Users.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/OTP-Screen.dart';
import 'package:aashas/screens/2-Authentication_Screen/pages/otp-login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MobileLoginScreen extends StatefulWidget {
  static const routeName = '/mobile-login';

  @override
  _MobileLoginScreenState createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  bool mobVal = true;
  void validate(BuildContext context) {
    setState(() {
      mobVal = _mobileController.text.length == 10;
    });
    if (mobVal) _handleSubmit(context);
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;
  void _handleSubmit(BuildContext context) async {
    final user = Provider.of<Users>(context);
    setState(() {
      isLoading = true;
    });

    final result =
        await user.generateOTP(number: int.parse(_mobileController.text));
    setState(() {
      isLoading = false;
    });

    Navigator.pushNamed(context, OTPLoginScreen.routeName,
        arguments: int.parse(_mobileController.text));
  }

  TextEditingController _mobileController;
  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
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
                controller: _mobileController,
                decoration: InputDecoration(
                  hintText: 'phone',
                  contentPadding: EdgeInsets.all(15),
                  errorText: mobVal ? null : "Enter valid mobile no.",
                  errorStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
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
                      loading: isLoading,
                      bgColor: KMRSButtonBGColor,
                      text: 'Send OTP',
                      textColor: KMRSButtonTextColor,
                      width: width * 0.65,
                      onTap: () => validate(context))),
            ],
          ),
        ),
      ),
    );
  }
}
