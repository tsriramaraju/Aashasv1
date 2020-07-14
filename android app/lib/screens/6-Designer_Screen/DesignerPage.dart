import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/DesignerAboutCard.dart';
import 'components/DesignerTitleCard.dart';
import 'components/ShopDetailsCard.dart';

class DesignerPage extends StatelessWidget {
  final Function onMenuPressed;
  DesignerPage({this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: onMenuPressed,
          color: Color(KCSTitleColor),
        ),
        backgroundColor: Color(KWSBGColor),
        brightness: Brightness.light,
        elevation: 0,
      ),
      body: Container(
        height: height * 0.81,
        child: ListView(
          padding: EdgeInsets.all(15),
          physics: BouncingScrollPhysics(),
          children: [
            DesignerTitleCard(height: height, width: width),
            SizedBox(
              height: height * 0.03,
            ),
            DesignerAboutCard(height: height),
            SizedBox(
              height: height * 0.03,
            ),
            ShopDetailsCard(height: height, width: width),
            SizedBox(
              height: height * 0.035,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Articles',
                      style: GoogleFonts.roboto(fontSize: 22),
                    ),
                    FlatButton(
                      child: Text(
                        'Show all',
                        style: GoogleFonts.roboto(
                            color: Color(KCSTitleColor).withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                            fontSize: height * 0.017),
                      ),
                      onPressed: null,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: height * .135,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: width * .5,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 0.05,
                            ),
                            Icon(
                              FontAwesomeIcons.tshirt,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 0.05,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: width * 0.3),
                              child: Text(
                                'How to Select wedding Dress',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: width * .5,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 0.05,
                            ),
                            Icon(
                              FontAwesomeIcons.tshirt,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 0.05,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: width * 0.3),
                              child: Text(
                                'How to Select wedding Dress',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: width * .5,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 0.05,
                            ),
                            Icon(
                              FontAwesomeIcons.tshirt,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 0.05,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: width * 0.3),
                              child: Text(
                                'How to Select wedding Dress',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: width * .5,
                        decoration: BoxDecoration(
                            color: Colors.yellow.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 0.05,
                            ),
                            Icon(
                              FontAwesomeIcons.tshirt,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 0.05,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: width * 0.3),
                              child: Text(
                                'How to Select wedding Dress',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: width * .5,
                        decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 0.05,
                            ),
                            Icon(
                              FontAwesomeIcons.tshirt,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 0.05,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: width * 0.3),
                              child: Text(
                                'How to Select wedding Dress',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
