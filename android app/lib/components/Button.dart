import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

GestureDetector buildButton(
    {Function onTap,
    String text,
    double width,
    double height,
    double fontSize,
    double radius,
    bool elevation,
    int textColor,
    bool loading = false,
    int bgColor,
    IconData icon,
    int iconColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height == null ? 50 : height,
      decoration: BoxDecoration(
        color: Color(bgColor),
        borderRadius:
            BorderRadius.all(Radius.circular(radius == null ? 25 : radius)),
        boxShadow: elevation == null
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.30),
                  blurRadius: 5.0,
                )
              ]
            : null,
      ),
      alignment: Alignment.center,
      child: loading
          ? CircularProgressIndicator(
              strokeWidth: 1.5,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            )
          : text != null
              ? Text(
                  text,
                  style: GoogleFonts.roboto(
                    color: Color(textColor),
                    fontSize: fontSize == null ? 18 : fontSize,
                  ),
                  textAlign: TextAlign.center,
                )
              : Icon(
                  icon,
                  color: Color(iconColor),
                ),
    ),
  );
}
