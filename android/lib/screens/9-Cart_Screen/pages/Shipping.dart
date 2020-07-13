import 'dart:ui';

import 'package:aashas/components/Button.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/screens/9-Cart_Screen/pages/Payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingPage extends StatefulWidget {
  static const routeName = '/shipping';

  @override
  _ShippingPageState createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  FocusNode _nameFocusNode;

  FocusNode _addressFocusNode;

  FocusNode _cityFocusNode;

  FocusNode _zipCodeFocusNode;

  FocusNode _countryFocusNode;

  FocusNode _notesFocusNode;

  _handleShipping() {
    Navigator.pushNamed(context, PaymentPage.routeName);
  }

  @override
  void initState() {
    super.initState();

    _nameFocusNode = FocusNode();
    _addressFocusNode = FocusNode();
    _cityFocusNode = FocusNode();
    _zipCodeFocusNode = FocusNode();
    _countryFocusNode = FocusNode();
    _notesFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.dark.copyWith();
    return AnnotatedRegion(
      value: _currentStyle,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Checkout',
            style: GoogleFonts.roboto(
                color: Color(KOTPButtonBGColor),
                fontSize: 21,
                fontWeight: FontWeight.w500),
          ),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(KOTPButtonBGColor),
          ),
          bottom: PreferredSize(
              child: Container(
//                color: Colors.teal[50],
                height: height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(KOTPButtonBGColor),
                    ),
                    Text(
                      '. . . .',
                      style: GoogleFonts.roboto(
                        color: Color(KOTPButtonBGColor).withOpacity(0.5),
                        fontSize: 30,
                      ),
                    ),
                    Icon(
                      Icons.credit_card,
                      color: Color(KOTPButtonBGColor).withOpacity(0.5),
                    ),
                    Text(
                      '. . . .',
                      style: GoogleFonts.roboto(
                          color: Color(KOTPButtonBGColor).withOpacity(0.5),
                          fontSize: 30),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Color(KOTPButtonBGColor).withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(height * 0.08)),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.all(15),
          physics: BouncingScrollPhysics(),
          children: [
            Text(
              'Step 1',
              style: GoogleFonts.roboto(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Shipping',
              style: GoogleFonts.roboto(
                  color: Color(KOTPButtonBGColor),
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Full Name',
              style: GoogleFonts.roboto(color: Colors.grey, fontSize: 14),
            ),
            TextField(
              focusNode: _nameFocusNode,
              onSubmitted: (val) => _addressFocusNode.requestFocus(),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(KRSBGColor).withOpacity(0.9),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(KRSBGColor).withOpacity(0.5),
                  ),
                ),
                contentPadding: EdgeInsets.all(5),
                hintStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Color(KRSBGColor)),
              ),
              cursorColor: Color(KRSTitleColor),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Address',
              style: GoogleFonts.roboto(color: Colors.grey, fontSize: 14),
            ),
            TextField(
              focusNode: _addressFocusNode,
              onSubmitted: (val) => _cityFocusNode.requestFocus(),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(KRSBGColor).withOpacity(0.9),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(KRSBGColor).withOpacity(0.5),
                  ),
                ),
                contentPadding: EdgeInsets.all(5),
                hintStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Color(KRSBGColor)),
              ),
              cursorColor: Color(KRSTitleColor),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'City',
                      style:
                          GoogleFonts.roboto(color: Colors.grey, fontSize: 14),
                    ),
                    Container(
                      width: width * 0.4,
                      child: TextField(
                        focusNode: _cityFocusNode,
                        onSubmitted: (val) => _zipCodeFocusNode.requestFocus(),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(KRSBGColor).withOpacity(0.9),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(KRSBGColor).withOpacity(0.5),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Color(KRSBGColor)),
                        ),
                        cursorColor: Color(KRSTitleColor),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Zip Code',
                      style:
                          GoogleFonts.roboto(color: Colors.grey, fontSize: 14),
                    ),
                    Container(
                      width: width * 0.4,
                      child: TextField(
                        focusNode: _zipCodeFocusNode,
                        onSubmitted: (val) => _countryFocusNode.requestFocus(),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(KRSBGColor).withOpacity(0.9),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(KRSBGColor).withOpacity(0.5),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Color(KRSBGColor)),
                        ),
                        cursorColor: Color(KRSTitleColor),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Country',
              style: GoogleFonts.roboto(color: Colors.grey, fontSize: 14),
            ),
            TextField(
              focusNode: _countryFocusNode,
              onSubmitted: (val) => _notesFocusNode.requestFocus(),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(KRSBGColor).withOpacity(0.9),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(KRSBGColor).withOpacity(0.5),
                  ),
                ),
                contentPadding: EdgeInsets.all(5),
                hintStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Color(KRSBGColor)),
              ),
              cursorColor: Color(KRSTitleColor),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Notes',
              style: GoogleFonts.roboto(color: Colors.grey, fontSize: 14),
            ),
            TextField(
              focusNode: _notesFocusNode,
              onSubmitted: (val) => _notesFocusNode.unfocus(),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(KRSBGColor).withOpacity(0.9),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(KRSBGColor).withOpacity(0.5),
                  ),
                ),
                contentPadding: EdgeInsets.all(5),
                hintStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Color(KRSBGColor)),
              ),
              cursorColor: Color(KRSTitleColor),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: height * 0.09,
              width: width,
              child: Align(
                child: buildButton(
                    onTap: _handleShipping,
                    width: width * 0.7,
                    text: 'Continue to Payment',
                    bgColor: KOTPButtonBGColor,
                    textColor: KHCSButtonTextColor),
              ),
            ),
          ],
        ),
//        bottomSheet:
      ),
    );
  }
}
