import 'package:aashas/components/Button.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/models/product-model.dart';
import 'package:aashas/providers/CartData.dart';
import 'package:aashas/providers/Products_Provider.dart';
import 'package:aashas/screens/4-Shop_Screen/components/ProductCards.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final Function onCartPressed;
  final Function onFavouritesPressed;
  final String id;
  ProductPage(
      {@required this.onFavouritesPressed,
      @required this.onCartPressed,
      @required this.id});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  _ProductPageState();
  Product item;
  String _selectedSize = 'S';
  void assignSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

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
      print("Product Page init state");
      await loadItem();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> loadItem() async {
    final prods = Provider.of<Products>(context);
    await prods.fetAndSetProducts();
    item = prods.products.firstWhere((element) => element.id == widget.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return isLoading
        ? CircularProgressIndicator()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(KNavBGColor),
              elevation: 0,
              brightness: Brightness.light,
              iconTheme: IconThemeData(
                color: Color(KOTPButtonBGColor),
              ),
              title: Text(
                item.name,
                style: GoogleFonts.roboto(
                    color: Color(KOTPButtonBGColor),
                    fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
              actions: [
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Color(KWSTitleColor),
                        ),
                        onPressed: widget.onFavouritesPressed),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Color(KWSTitleColor),
                      ),
                      onPressed: widget.onCartPressed,
                    )
                  ],
                )
              ],
            ),
            backgroundColor: Color(KNavBGColor),
            body: Container(
              height: height * 0.81,
              child: ListView(
                padding: EdgeInsets.all(15),
                physics: BouncingScrollPhysics(),
                children: [
                  ProductCards(height: height, item: item, width: width),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Size',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Color(KOTPButtonBGColor).withOpacity(0.4),
                            fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ...item.size
                                .map((index) => SizeButtons(
                                      color: _selectedSize,
                                      id: index,
                                      toggle: assignSize,
                                    ))
                                .toList(),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    item.description,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      wordSpacing: 2,
                      letterSpacing: 0.5,
                      height: 1.25,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    child: buildButton(
                        onTap: () {
                          Provider.of<CartData>(
                            context,
                          ).addItem(item.name, _selectedSize, item.price,
                              item.id, item.images[0]);
                        },
                        textColor: KOTPButtonTextColor,
                        fontSize: 12,
                        text: '+ Add to Bag',
                        bgColor: KOTPButtonBGColor,
                        width: width * .6),
                  )
                ],
              ),
            ),
          );
  }
}

class SizeButtons extends StatelessWidget {
  const SizeButtons({Key key, @required this.color, this.id, this.toggle})
      : super(key: key);

  final String color;
  final String id;
  final Function toggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggle(id),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: color == id ? Colors.grey[300] : Colors.transparent,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          id,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
