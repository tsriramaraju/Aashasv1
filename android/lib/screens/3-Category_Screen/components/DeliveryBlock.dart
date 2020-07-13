import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryBlock extends StatefulWidget {
  const DeliveryBlock({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  _DeliveryBlockState createState() => _DeliveryBlockState();
}

class _DeliveryBlockState extends State<DeliveryBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.125,
      decoration: BoxDecoration(
          color: Color(KHCSDeliveryCardColor),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          )),
      child: Stack(
        children: [
          FlareActor(
            KMaleCategoryDeliveryBGFlare,
            fit: BoxFit.cover,
            animation: 'animation1',
          ),
          Positioned(
            child: Text(
              KMaleCSDeliveryText,
              style: GoogleFonts.roboto(
                  color: Color(KHCSDeliveryTextColor),
                  fontSize: widget.height * 0.027,
                  fontWeight: FontWeight.w500),
            ),
            right: widget.width * 0.20,
            top: widget.height * 0.03,
          ),
          Positioned(
            left: 15,
            bottom: -21,
            child: SvgPicture.asset(
              KMaleCategoryDeliveryImg,
              fit: BoxFit.fitWidth,
              width: 150,
            ),
          )
//          FlareActor(
//            KMaleCategoryDeliveryFlare,
//            animation: 'delivery',
//            fit: BoxFit.fitHeight,
//          )
        ],
      ),
    );
  }
}
