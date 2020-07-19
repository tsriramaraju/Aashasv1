import 'package:admin/models/product-model.dart';
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
    }
    _isInit = false;
    super.didChangeDependencies();
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
                        width: widget.width * 0.8,
                        fit: BoxFit.cover,
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
