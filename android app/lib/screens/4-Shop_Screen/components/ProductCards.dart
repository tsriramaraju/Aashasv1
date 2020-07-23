import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/models/product-model.dart';
import 'package:aashas/providers/Favourites.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductCards extends StatefulWidget {
  const ProductCards({
    Key key,
    @required this.height,
    @required this.item,
    @required this.width,
  }) : super(key: key);

  final double height;
  final Product item;
  final double width;

  @override
  _ProductCardsState createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
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
      print("Product Cards init state");
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
      isFav = fav.isFav(widget.item.id);
      print("isFav $isFav");
      isFavLoading = false;
    });
  }

  Future<void> toggleFav() async {
    setState(() {
      isFavLoading = true;
    });
    final fav = Provider.of<Favourites>(context, listen: true);
    final res = await fav.toggleItem(widget.item.id);
    print(res);

    setState(() {
      isFavLoading = false;
      res == "Favourites added suceffully" ? isFav = true : isFav = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.5,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          ...widget.item.images.map((index) {
            return Row(
              children: [
                Stack(
                  fit: StackFit.loose,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          index,
                          alignment: Alignment.topCenter,
                        )),
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: Align(
                        child: isFavLoading
                            ? Container(
                                height: 35,
                                width: 35,
                                child:
//                        CircularProgressIndicator()
                                    FlareActor(
                                  LOADING,
                                  animation: !isFav ? "Success" : "Error",
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : Container(
                                height: 35,
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
                                      size: 16,
                                    ),
                                    onPressed: () {
                                      toggleFav();
                                    }),
                              ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      bottom: 5,
                      child: Align(
                        child: Container(
                          height: widget.height * 0.04,
                          width: widget.width * 0.2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          padding: EdgeInsets.symmetric(vertical: 0),
                          child: Text(
                            '\$${widget.item.price.toString()}',
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                )
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
