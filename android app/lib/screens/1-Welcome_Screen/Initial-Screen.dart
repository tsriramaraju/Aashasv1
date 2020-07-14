import 'dart:ui';

import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/Welcome-Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.white10.withOpacity(0)));
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            child: Image.asset(
              KOpeningImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            height: height * 0.2,
            width: width * 0.8,
            top: height * 0.30,
            left: width * 0.1,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
              child: SvgPicture.asset(
                KLogoFull,
                fit: BoxFit.fitHeight,
                color: Color(KInitialScreenLogoColor),
                semanticsLabel: "Aasha's Logo",
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.2,
            child: Container(
              width: width,
              child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.chevronRight,
                    color: Color(KInitialScreenArrowColor).withOpacity(0.7),
                    size: height * 0.05,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, WelcomeScreen.routeName);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
