import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/text.dart';
import 'package:aashas/providers/Products_Provider.dart';
import 'package:aashas/screens/3-Category_Screen/pages/her-category.dart';
import 'package:aashas/screens/3-Category_Screen/pages/him-category.dart';
import 'package:aashas/screens/3-Category_Screen/pages/them-category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Function onMenuPressed;
  final Function onCartPressed;
  final Function onFavouritesPressed;
  final Function handleShop;
  CategoryScreen(
      {this.navigatorKey,
      this.handleShop,
      this.onMenuPressed,
      this.onCartPressed,
      this.onFavouritesPressed});
  void _handleTap(String category) async {
    var route;
    if (category == 'him')
      route = HimCategory(
        onFavouritesPressed: onFavouritesPressed,
        onCartPressed: onCartPressed,
      );
    else if (category == 'her')
      route = HerCategory(
        onFavouritesPressed: onFavouritesPressed,
        onCartPressed: onCartPressed,
      );
    else
      route = ThemCategory(
        onFavouritesPressed: onFavouritesPressed,
        onCartPressed: onCartPressed,
      );
    final Map<String, String> filter =
        await navigatorKey.currentState.push(MaterialPageRoute(
      builder: (context) => route,
    ));
    if (filter != null) handleShop(filter);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    final height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).size.height * 0.19);
    final width = MediaQuery.of(context).size.width;
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return new MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  KCSTitleText,
                  style: GoogleFonts.roboto(color: Color(KWSTitleColor)),
                ),
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: onMenuPressed,
                  color: Color(KCSTitleColor),
                ),
                backgroundColor: Color(KWSBGColor),
                brightness: Brightness.light,
                elevation: 0,
                actions: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Color(KWSTitleColor),
                          ),
                          onPressed: onFavouritesPressed),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Color(KWSTitleColor),
                        ),
                        onPressed: onCartPressed,
                      )
                    ],
                  )
                ],
              ),
              body: Container(
                  width: width,
                  height: height,
                  color: Color(KCSBGColor),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: height * 0.022,
                      ),
                      GestureDetector(
                        onTap: () => _handleTap('him'),
                        child: Align(
                          child: Container(
                            height: height * .35,
                            width: width * .80,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(KCSCardColor).withOpacity(1),
                                Color(KCSCardColor).withOpacity(0.6)
                              ]),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2.5,
                                )
                              ],
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Positioned(
                                  top: 30,
                                  left: 10,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      KCategoryMaleImg,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 25,
                                  right: 25,
                                  child: Text(
                                    KCSMaleCardTitleText,
                                    style: GoogleFonts.roboto(
                                        color: Color(
                                          KCSCardTitleColor,
                                        ),
                                        fontSize: height * 0.05),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.022,
                      ),
                      GestureDetector(
                        onTap: () => _handleTap('her'),
                        child: Align(
                          child: Container(
                            height: height * .35,
                            width: width * .80,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(KCSCardColor).withOpacity(0.6),
                                Color(KCSCardColor).withOpacity(1)
                              ]),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2.5,
                                )
                              ],
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      KCategoryFemaleImg,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 25,
                                  left: 25,
                                  child: Text(
                                    KCSFeMaleCardTitleText,
                                    style: GoogleFonts.roboto(
                                        color: Color(
                                          KCSCardTitleColor,
                                        ),
                                        fontSize: height * 0.05),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.022,
                      ),
                      GestureDetector(
                        onTap: () => _handleTap('them'),
                        child: Align(
                          child: Container(
                            height: height * .23,
                            width: width * .80,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(KCSCardColor).withOpacity(0.6),
                                Color(KCSCardColor).withOpacity(1)
                              ]),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2.5,
                                )
                              ],
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      KCategoryFemaleImg,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    KCSThemCardTitleText,
                                    style: GoogleFonts.roboto(
                                        color: Color(
                                          KCSCardTitleColor,
                                        ),
                                        fontSize: height * 0.05),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          },
        );
      },
    );
  }
}
