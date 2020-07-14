import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignerTitleCard extends StatelessWidget {
  const DesignerTitleCard({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/other/profile.jpg',
              fit: BoxFit.cover,
              width: width * 0.4,
              height: height * 0.25,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Anitha \nKommareddy',
                style: GoogleFonts.roboto(
                    color: Color(KOTPButtonBGColor),
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Container(
//                            height: 50,
//                            width: 50,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                        icon: Icon(
                          Icons.message,
                          size: 26,
                        ),
                        onPressed: null),
                  ),
                  SizedBox(width: 15),
                  Container(
//                            height: 50,
//                            width: 50,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                        icon: Icon(
                          Icons.call,
                          size: 26,
                        ),
                        onPressed: null),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
