import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/screens/10-Favourite_Screen/components/FavouriteITemTIle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.dark.copyWith();
    return AnnotatedRegion(
      value: _currentStyle,
      child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Color(KOTPButtonBGColor),
            ),
          ),
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
//            color: Colors.grey,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wish List',
                  style: GoogleFonts.roboto(
                      color: Color(KOTPButtonBGColor),
                      fontSize: 21,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '63 items found',
                  style: GoogleFonts.roboto(
                      color: Color(KOTPButtonBGColor).withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: height * 0.80,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      FavouriteItemTile(height: height, width: width),
                      Divider(
                        height: 40,
                        color: Colors.grey[300],
                        thickness: 1.5,
                      ),
                      FavouriteItemTile(height: height, width: width),
                      Divider(
                        height: 40,
                        color: Colors.grey[300],
                        thickness: 1.5,
                      ),
                      FavouriteItemTile(height: height, width: width),
                      Divider(
                        height: 40,
                        color: Colors.grey[300],
                        thickness: 1.5,
                      ),
                      FavouriteItemTile(height: height, width: width),
                      Divider(
                        height: 40,
                        color: Colors.grey[300],
                        thickness: 1.5,
                      ),
                      FavouriteItemTile(height: height, width: width),
                      Divider(
                        height: 40,
                        color: Colors.grey[300],
                        thickness: 1.5,
                      ),
                      FavouriteItemTile(height: height, width: width),
                      Divider(
                        height: 40,
                        color: Colors.grey[300],
                        thickness: 1.5,
                      ),
                      FavouriteItemTile(height: height, width: width),
                      Divider(
                        height: 40,
                        color: Colors.grey[300],
                        thickness: 1.5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
