import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/models/product-model.dart';
import 'package:aashas/providers/Favourites.dart';
import 'package:aashas/screens/4-Shop_Screen/pages/ProductPage.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductGridTileSquare extends StatefulWidget {
  const ProductGridTileSquare(
      {this.height,
      this.price,
      this.width,
      this.img,
      this.onCartPressed,
      this.onFavouritePressed,
      this.isNew,
      this.isFavourite,
      this.title,
      this.id});

  final double height;
  final double width;
  final Function onFavouritePressed;
  final Function onCartPressed;
  final String img;
  final String title;
  final bool isNew;
  final bool isFavourite;
  final double price;
  final String id;

  @override
  _ProductGridTileSquareState createState() => _ProductGridTileSquareState();
}

class _ProductGridTileSquareState extends State<ProductGridTileSquare> {
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
        ? CircularProgressIndicator()
        : InkWell(
            onTap: () => showProduct(context),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: widget.height * .265,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            widget.img,
                            fit: BoxFit.cover,
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
                                          isFav
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
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: Text(
                                      'New',
                                      style: GoogleFonts.roboto(fontSize: 12),
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
                    height: 5,
                  ),
                  Text(
                    '   ${widget.title}',
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '    \$${widget.price.toString()}',
                    style: GoogleFonts.roboto(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
