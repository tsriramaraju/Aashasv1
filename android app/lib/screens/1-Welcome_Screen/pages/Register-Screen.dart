import 'package:aashas/components/Button.dart';
import 'package:aashas/drawerHome.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/styles.dart';
import 'package:aashas/providers/Users.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/name-registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'mobile-Registration.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  FocusNode _nameFocusNode;
  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _nameFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  bool nameVal = true;
  bool emailVal = true;
  bool passwordVal = true;
  bool isLoading = false;
  void validate(BuildContext context) {
    setState(() {
      _nameController.text.length >= 4 ? nameVal = true : nameVal = false;
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(_emailController.text)
          ? emailVal = true
          : emailVal = false;
      _passwordController.text.length > 5
          ? passwordVal = true
          : passwordVal = false;
    });

    if (nameVal && emailVal && passwordVal) _handleSignUp(context);
  }

  void _handleSignUp(BuildContext context) async {
    final user = Provider.of<Users>(context);
    isLoading = true;
    final result = await user.setUserDetails(
        _nameController.text, _emailController.text, _passwordController.text);
    setState(() {
      isLoading = false;
    });
    if (!result) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Email Id Exists'),
        duration: Duration(seconds: 3),
      ));
      return;
    }
    Navigator.pushNamed(context, MobileRegistrationScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final bool tab = width > 700;

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(KRSBGColor),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(tab ? 50 : 25),
          child: Container(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Create your\naccount with email ",
                  style: GoogleFonts.roboto(
                    fontSize: height * 0.035,
                    color: Color(KWSTitleColor),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: tab ? height * 0.06 : height * 0.03,
                ),
                Container(
                  height: tab ? 400 : null,
                  decoration: KInputBox,
                  child: Column(
                    mainAxisAlignment: tab
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(KRSBGColor),
                            ),
                          ),
                          hintText: "Your Name",
                          errorText: nameVal
                              ? null
                              : "Name should be at least 4 characters long",
                          errorStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                              fontSize: tab ? 26 : null),
                          contentPadding: EdgeInsets.all(25),
                          hintStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Color(KRSBGColor),
                              fontSize: tab ? 26 : null),
                        ),
                        cursorColor: Color(KRSTitleColor),
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        focusNode: _nameFocusNode,
                        onSubmitted: (val) {
                          _emailFocusNode.requestFocus();
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(KRSBGColor),
                            ),
                          ),
                          errorText:
                              emailVal ? null : "Please enter valid email",
                          errorStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                              fontSize: tab ? 26 : null),
                          hintText: "Email",
                          contentPadding: EdgeInsets.all(25),
                          hintStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Color(KRSBGColor),
                              fontSize: tab ? 26 : null),
                        ),
                        cursorColor: Color(KRSTitleColor),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: _emailFocusNode,
                        onSubmitted: (val) {
                          _passwordFocusNode.requestFocus();
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Password",
                          errorText: passwordVal
                              ? null
                              : "password should be minimum 6 characters long",
                          errorStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                              fontSize: tab ? 26 : null),
                          contentPadding: EdgeInsets.all(25),
                          hintStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Color(KRSBGColor),
                              fontSize: tab ? 26 : null),
                        ),
                        cursorColor: Color(KRSTitleColor),
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        focusNode: _passwordFocusNode,
                        onSubmitted: (val) {
                          _passwordFocusNode.unfocus();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: tab ? height * 0.025 : height * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Terms of Use",
                          style: GoogleFonts.roboto(
                            color: Color(KRSTitleColor),
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Text(
                      "and",
                      style: GoogleFonts.roboto(
                        color: Color(0xffC8B9AF),
                      ),
                    ),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy Policy",
                          style: GoogleFonts.roboto(
                            color: Color(KRSTitleColor),
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
                Center(
                  child: buildButton(
                    textColor: KRSButtonTextColor,
                    text: 'Sign up',
                    height: tab ? 75 : null,
                    fontSize: tab ? 32 : null,
                    bgColor: KRSButtonBGColor,
                    width: width * .75,
                    loading: isLoading,
                    onTap: () {
                      return validate(context);
                    },
                  ),
                ),
                SizedBox(
                  height: tab ? height * 0.025 : height * 0.015,
                ),
                Center(
                  child: Text(
                    "or sign up with social account ",
                    style: GoogleFonts.roboto(
                        color: Color(KRSTitleColor),
                        fontWeight: FontWeight.w600,
                        fontSize: tab ? 21 : null),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //Facebook button
                    buildButton(
                        icon: FontAwesomeIcons.facebookF,
                        width: width * .40,
                        height: tab ? 60 : null,
                        iconColor: KRSButtonIconColor,
                        bgColor: KRSFBColor,
                        onTap: null),
                    buildButton(
                        icon: FontAwesomeIcons.twitter,
                        width: width * .40,
                        height: tab ? 60 : null,
                        iconColor: KRSButtonIconColor,
                        bgColor: KRSTwitterColor,
                        onTap: null),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    buildButton(
                        icon: FontAwesomeIcons.google,
                        width: width * .40,
                        height: tab ? 60 : null,
                        iconColor: KRSButtonIconColor,
                        bgColor: KRSGoogleColor,
                        onTap: null),
                    buildButton(
                        icon: FontAwesomeIcons.phone,
                        width: width * .40,
                        height: tab ? 60 : null,
                        iconColor: KRSButtonIconColor,
                        bgColor: KRSMobileColor,
                        onTap: null),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
