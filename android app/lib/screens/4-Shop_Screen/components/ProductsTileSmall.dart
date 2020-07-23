import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/helpers/constants/styles.dart';
import 'package:aashas/providers/Favourites.dart';
import 'package:aashas/screens/4-Shop_Screen/pages/ProductPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductsTile extends StatefulWidget {
  const ProductsTile(
      {this.height,
      this.price,
      this.width,
      this.id,
      this.img,
      this.isNew,
      this.isFavourite,
      this.onCartPressed,
      this.onFavouritePressed,
      this.title});

  final double height;
  final double width;
  final Function onFavouritePressed;
  final Function onCartPressed;
  final String img;
  final String id;
  final String title;
  final bool isNew;
  final bool isFavourite;
  final double price;

  @override
  _ProductsTileState createState() => _ProductsTileState();
}

class _ProductsTileState extends State<ProductsTile> {
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
      print("Product GRIDITEMS square init state");
      await loadItem();
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  bool isFav = false;
  bool isFavLoading = true;
  Future<void> loadItem() async {
    final fav = Provider.of<Favourites>(context);
    setState(() {
      isFav = fav.isFav(widget.id);
      isLoading = false;
      isFavLoading = false;
    });
  }

  Future<void> toggleFav() async {
    setState(() {
      isFavLoading = true;
    });
    final fav = Provider.of<Favourites>(context, listen: true);
    final res = await fav.toggleItem(widget.id);
    print(res);

    setState(() {
      isFavLoading = false;
      res == "Favourites added suceffully" ? isFav = true : isFav = false;
    });
  }

  void showProduct(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductPage(
            id: widget.id,
            onCartPressed: widget.onCartPressed,
            onFavouritesPressed: widget.onFavouritePressed,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Flexible(
            child: FlareActor(
            LOADING,
            animation: "loading",
            fit: BoxFit.cover,
          ))
        : InkWell(
            onTap: () => showProduct(context),
            child: Container(
              decoration: KInputBox.copyWith(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: widget.height * .3,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: widget.img,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            placeholder: (context, url) => Flexible(
                                child: FlareActor(
                              LOADING,
                              animation: "Loading",
                            )),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          top: 5,
                          child: Align(
                            child: isFavLoading
                                ? Container(
                                    height: 30,
                                    width: 30,
                                    child:
//
                                        FlareActor(
                                      LOADING,
                                      animation: !isFav ? "Success" : "Error",
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )
                                : Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                        icon: Icon(
                                          widget.isFavourite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.red,
                                          size: 14,
                                        ),
                                        onPressed: toggleFav),
                                  ),
                          ),
                        ),
                        widget.isNew
                            ? Positioned(
                                left: 5,
                                bottom: 5,
                                child: Align(
                                  child: Container(
                                    height: widget.height * 0.03,
                                    width: widget.width * 0.12,
                                    decoration: BoxDecoration(
                                        color: Color(KOTPButtonBGColor),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: Text(
                                      'New',
                                      style: GoogleFonts.roboto(
                                          fontSize: 12, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              )
                            : Text('')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: widget.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.title}',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: widget.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '\$${widget.price.toString()}',
                      style: GoogleFonts.roboto(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
