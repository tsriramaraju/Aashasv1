import 'package:aashas/components/Button.dart';
import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/text.dart';
import 'package:aashas/screens/1-Welcome_Screen/components/Welcome_Screen_Cards.dart';
import 'package:aashas/screens/2-Authentication_Screen/pages/login-screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Register-Screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome-screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(KWSBGColor),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
//              color: Colors.teal,
              child: CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 6),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
//                pauseAutoPlayOnTouch: Duration(seconds: 10),
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  height: height * .70,
                ),
                items: [
                  WelcomeScreenCard(
                    title: KWSCard1Title,
                    description: KWSCard1Description,
                    imageAddress: KWSCard1Img,
                  ),
                  WelcomeScreenCard(
                    title: KWSCard2Title,
                    description: KWSCard2Description,
                    imageAddress: KWSCard2Img,
                  ),
                  WelcomeScreenCard(
                    title: KWSCard3Title,
                    description: KWSCard3Description,
                    imageAddress: KWSCard3Img,
                  ),
                ],
              ),
            ),
            BottomPart(width, context)
          ],
        ));
  }
}

class BottomPart extends StatelessWidget {
  void _handleNavigation(String name) {
    Navigator.pushReplacementNamed(context, name);
  }

  final width;
  final context;

  BottomPart(this.width, this.context);
  @override
  Widget build(BuildContext context) {
    final bool tab = width > 700;
    return Container(
      child: Column(
        children: <Widget>[
          buildButton(
              width: width * .75,
              height: tab ? 75 : null,
              fontSize: tab ? 32 : null,
              text: KWSButtonText,
              bgColor: KWSButtonBGColor,
              textColor: KWSButtonTextColor,
              onTap: () => _handleNavigation(RegisterScreen.routeName)),
          FlatButton(
            onPressed: () => _handleNavigation(LoginScreen.routeName),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.roboto(
                  color: Color(KWSFlatButtonTextColor),
                  fontWeight: FontWeight.w400,
                ),
                children: <TextSpan>[
                  TextSpan(text: KWSFlatButtonText),
                  TextSpan(
                      text: '  Log in',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
