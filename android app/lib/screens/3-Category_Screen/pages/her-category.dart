import 'package:aashas/components/Button.dart';
import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/text.dart';
import 'package:aashas/screens/3-Category_Screen/components/DeliveryBlock.dart';
import 'package:aashas/screens/3-Category_Screen/components/HeroCategoryImgBlock.dart';
import 'package:aashas/screens/3-Category_Screen/components/HeroTextBlock.dart';
import 'package:aashas/screens/3-Category_Screen/components/MiniCategoryBlock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HerCategory extends StatelessWidget {
  final Function onFavouritesPressed;
  final Function onCartPressed;
  HerCategory({this.onCartPressed, this.onFavouritesPressed});
  void _goToShop(BuildContext context, String subCategory) {
    Navigator.of(context)
        .pop({'category': 'female', 'subCategory': subCategory});
  }

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).size.height * 0.19);
    final width = MediaQuery.of(context).size.width;
//    void _goToShop() {
//      Navigator.of(context).pop(0);
//    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(KHCSTitleColor)),
          title: Text(
            KFemaleCSTitleText,
            style: GoogleFonts.roboto(color: Color(KHCSTitleColor)),
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
                    color: Color(KHCSTitleColor),
                  ),
                  onPressed: onFavouritesPressed,
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Color(KHCSTitleColor),
                  ),
                  onPressed: onCartPressed,
                )
              ],
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: height,
          width: width,
          child: ListView(
            children: [
              DeliveryBlock(height: height, width: width),
              SizedBox(
                height: height * 0.04,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    KHERCARD,
                    height: 350,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              HeroTextBlock(
                height: height,
                title: KFemaleCSHeroTitle1Text,
                description: "",
              ),
              SizedBox(
                height: height * 0.04,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    KHERCARD2,
                    height: 350,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              HeroTextBlock(
                height: height,
                title: KFemaleCSHeroTitle2Text,
                description: KFemaleCSHeroDescription2Text,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Align(
                child: buildButton(
                    onTap: () => _goToShop(context, 'all'),
                    bgColor: KHCSButtonBGColor,
                    text: KFemaleCSButtonText,
                    width: width * 0.5,
                    textColor: KHCSButtonTextColor),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MiniCategoryBlock(
                    onTap: () => _goToShop(context, 'wedding'),
                    width: width,
                    height: height,
                    title: KFemaleCSCat1Text,
                    image: KFemaleCat1Img,
                  ),
                  MiniCategoryBlock(
                    onTap: () => _goToShop(context, 'blouse'),
                    width: width,
                    height: height,
                    title: KFemaleCSCat2Text,
                    image: KFemaleCat2Img,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MiniCategoryBlock(
                    onTap: () => _goToShop(context, 'wedding'),
                    width: width,
                    height: height,
                    title: KFemaleCSCat3Text,
                    image: KFemaleCat3Img,
                  ),
                  MiniCategoryBlock(
                    onTap: () => _goToShop(context, 'lehengas'),
                    width: width,
                    height: height,
                    title: KFemaleCSCat4Text,
                    image: KFemaleCat4Img,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
