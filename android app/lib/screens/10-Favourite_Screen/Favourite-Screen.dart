import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/models/Favourites-model.dart';
import 'package:aashas/providers/Favourites.dart';
import 'package:aashas/screens/10-Favourite_Screen/components/FavouriteITemTIle.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool isLoading = false;
  var _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      print("Faourites page init state");
      await loadItem();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  List<Favourite> favourites;
  int favCount = 0;
  Future<void> loadItem() async {
    final fav = Provider.of<Favourites>(context);
    await fav.fetchAndSetFavourites();
    favourites = fav.items;
    setState(() {
      favCount = fav.favCount();
      isLoading = false;
    });
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
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Color(KOTPButtonBGColor),
            ),
          ),
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
//            color: Colors.grey,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wish List',
                  style: GoogleFonts.roboto(
                      color: Color(KOTPButtonBGColor),
                      fontSize: 21,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '$favCount items found',
                  style: GoogleFonts.roboto(
                      color: Color(KOTPButtonBGColor).withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                isLoading
                    ? Container(
                        height: height * 0.5,
                        child: FlareActor(
                          LOADING,
                          animation: "Loading",
                        ),
                      )
                    : Container(
                        height: height * 0.80,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            ...favourites.map(
                              (e) => FavouriteItemTile(
                                height: height,
                                width: width,
                                title: e.title,
                                color: e.color,
                                img: e.img,
                                id: e.prodId,
                                price: e.price.toInt(),
                                size: e.size,
                              ),
                            )
                          ],
                        ),
                      )
              ],
            ),
          )),
    );
  }
}
