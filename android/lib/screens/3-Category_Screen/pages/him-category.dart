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

class HimCategory extends StatelessWidget {
  final Function onFavouritesPressed;
  final Function onCartPressed;
  HimCategory({this.onCartPressed, this.onFavouritesPressed});
  void _goToShop(BuildContext context, String subCategory) {
    Navigator.of(context).pop({'category': 'male', 'subCategory': subCategory});
  }

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).size.height * 0.19);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(KHCSTitleColor)),
          title: Text(
            KMaleCSTitleText,
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
                    onPressed: onFavouritesPressed),
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
          padding: EdgeInsets.all(25),
          height: height,
          width: width,
          child: ListView(
            children: [
              DeliveryBlock(height: height, width: width),
              SizedBox(
                height: height * 0.04,
              ),
              HeroCategoryImgBlock(
                onTap: () => _goToShop(context, 'wedding'),
                height: height,
                image: KCategoryMaleImg,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              HeroTextBlock(
                height: height,
                title: KMaleCSHeroTitle1Text,
                description: KMaleCSHeroDescription1Text,
              ),
              SizedBox(
                height: height * 0.04,
              ),
              HeroCategoryImgBlock(
                onTap: () => _goToShop(context, 'kurta'),
                height: height,
                image: KCategoryFemaleImg,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              HeroTextBlock(
                height: height,
                title: KMaleCSHeroTitle2Text,
                description: KMaleCSHeroDescription2Text,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Align(
                child: buildButton(
                    onTap: () => _goToShop(context, 'all'),
                    bgColor: KHCSButtonBGColor,
                    text: KMaleCSButtonText,
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
                    title: KMaleCSCat1Text,
                    image: KMaleCat1Img,
                  ),
                  MiniCategoryBlock(
                    onTap: () => _goToShop(context, 'accessories'),
                    width: width,
                    height: height,
                    title: KMaleCSCat2Text,
                    image: KMaleCat2Img,
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
                    onTap: () => _goToShop(context, 'party wear'),
                    width: width,
                    height: height,
                    title: KMaleCSCat3Text,
                    image: KMaleCat3Img,
                  ),
                  MiniCategoryBlock(
                    onTap: () => _goToShop(context, 'kurta'),
                    width: width,
                    height: height,
                    title: KMaleCSCat4Text,
                    image: KMaleCat4Img,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
