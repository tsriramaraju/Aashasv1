import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ShopPage.dart';

class ShopScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Function onMenuPressed;
  final Function onCartPressed;
  final Function onFavouritesPressed;
  ShopScreen(
      {this.navigatorKey,
      this.onMenuPressed,
      this.onCartPressed,
      this.onFavouritesPressed});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.light;
    final height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).size.height * 0.19);
    final width = MediaQuery.of(context).size.width;
    return AnnotatedRegion(
      value: _currentStyle,
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) {
//            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//                statusBarColor: Colors.transparent,
//                statusBarIconBrightness:
//                    Brightness.light //or set color with: Color(0xFF0000FF)
//                ));
              return ShopPage(
                height: height,
                width: width,
                onMenuPressed: onMenuPressed,
                onFavouritesPressed: onFavouritesPressed,
                onCartPressed: onCartPressed,
              );
            },
          );
        },
      ),
    );
  }
}
