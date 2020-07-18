import 'package:admin/helpers/colors.dart';
import 'package:admin/screens/addProducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  static const routeName = '/dash-board';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(KDrawerBGColor),
          title: Text("Admin Console"),
          centerTitle: true,
        ),
        body: Center(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            crossAxisSpacing: 15,
            mainAxisSpacing: 25,
            crossAxisCount: 2,
            children: <Widget>[
              InkWell(
                onTap: () =>
                    {Navigator.pushNamed(context, AddProductScreen.routeName)},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0XFFDADBD2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Add Products",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Color(KLSTitleColor).withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0XFFDADBD2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "Manage Products",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Color(KLSTitleColor).withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0XFFDADBD2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "Add offers",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Color(KLSTitleColor).withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0XFFDADBD2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "Remove Offer",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Color(KLSTitleColor).withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0XFFDADBD2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "View Orders",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Color(KLSTitleColor).withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0XFFDADBD2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "Update bio",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Color(KLSTitleColor).withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
