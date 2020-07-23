import 'dart:ui';

import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/main-home.dart';
import 'package:aashas/providers/Products_Provider.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/Welcome-Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  void _load(BuildContext context) async {
//    final products = Provider.of<Products>(context);
//    await products.fetAndSetProducts();
    Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
  }

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
            width: width * 0.9,
            top: height * 0.30,
            left: width * 0.05,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 8),
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
                  onPressed: () => _load(context)),
            ),
          ),
        ],
      ),
    );
  }
}
