import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteItemTile extends StatelessWidget {
  const FavouriteItemTile({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              KOpeningImage,
              width: width * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Cardigan rib Knit',
                  style: GoogleFonts.raleway(
                      color: Color(KOTPButtonBGColor),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '\$90',
                  style: GoogleFonts.roboto(
                      color: Color(KOTPButtonBGColor).withOpacity(0.75),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Size: M | Color:Black',
                  style: GoogleFonts.raleway(
                      color: Color(KOTPButtonBGColor).withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: null,
                  child: Container(
                    height: height * 0.045,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border:
                            Border.all(color: Colors.deepPurple, width: 1.5)),
                    alignment: Alignment.center,
                    child: Text(
                      'Move to Bag',
                      style: GoogleFonts.raleway(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
