import 'package:admin/dashboard.dart';
import 'package:admin/helpers/Button.dart';
import 'package:admin/helpers/colors.dart';
import 'package:admin/helpers/styles.dart';
import 'package:admin/providers/Users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();

    _passwordController.dispose();

    _passwordFocusNode.dispose();
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool emailVal = true;
  bool passwordVal = true;
  bool isLoading = false;
  void validate(BuildContext context) {
    setState(() {
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(_emailController.text)
          ? emailVal = true
          : emailVal = false;
      _passwordController.text.length > 5
          ? passwordVal = true
          : passwordVal = false;
    });

//    if (emailVal && passwordVal)
    _handleSignIn(context);
  }

  void _handleSignIn(BuildContext context) async {
    final user = Provider.of<Users>(context);
    isLoading = true;
    final res =
        await user.emailLogin(_emailController.text, _passwordController.text);
    setState(() {
      isLoading = false;
    });
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(res), duration: Duration(seconds: 3)));
    if (res == "Login success")
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(KLSBGColor),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Container(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height * 0.1,
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/logo_full.svg',
//                  color: Colors.black,
                    width: width * 0.6,
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                  "Log into \nyour account",
                  style: GoogleFonts.roboto(
                    fontSize: height * 0.035,
                    color: Color(KLSTitleColor),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  decoration: KInputBox,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(KLSBGColor),
                            ),
                          ),
                          hintText: "Email",
                          errorText:
                              emailVal ? null : "Please enter valid email",
                          errorStyle: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                          contentPadding: EdgeInsets.all(25),
                          hintStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Color(KLSBGColor)),
                        ),
                        cursorColor: Color(KLSTitleColor),
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
                              : "Password must be min 6 characters long ",
                          errorStyle: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                          suffix: GestureDetector(
                            onTap: null,
                            child: Text(
                              'Forgot ?',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  color: Color(KWSTitleColor).withOpacity(0.6)),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(25),
                          hintStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Color(KRSBGColor)),
                        ),
                        cursorColor: Color(KWSTitleColor),
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
                  height: height * 0.035,
                ),
                Center(
                  child: buildButton(
                    textColor: KLSButtonTextColor,
                    text: 'Login',
                    bgColor: KLSButtonBGColor,
                    width: width * .75,
                    loading: isLoading,
                    onTap: () => validate(context),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
              ],
            ),
          ),
        ));
  }
}
