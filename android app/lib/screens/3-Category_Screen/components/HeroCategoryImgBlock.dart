import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';

class HeroCategoryImgBlock extends StatelessWidget {
  const HeroCategoryImgBlock(
      {Key key,
      @required this.height,
      @required this.image,
      @required this.onTap})
      : super(key: key);

  final double height;
  final Function onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.52,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(KHCSCardColor),
              Color(KHCSCardGradColor),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          image,
          fit: BoxFit.fitWidth,
        ),
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
