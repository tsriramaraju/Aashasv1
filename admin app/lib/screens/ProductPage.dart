import 'package:admin/components/ProductCards.dart';
import 'package:admin/helpers/Button.dart';
import 'package:admin/helpers/colors.dart';
import 'package:admin/models/product-model.dart';
import 'package:admin/providers/Products_Provider.dart';
import 'package:admin/screens/editProduct.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../helpers/Images.dart';

class ProductPage extends StatefulWidget {
  final String id;
  ProductPage({@required this.id});

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

  void editItem() {
    Navigator.pushNamed(context, EditProductScreen.routeName, arguments: item);
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(KNavBGColor),
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Color(KOTPButtonBGColor),
        ),
        title: Text(
          isLoading ? "loading" : item.name,
          style: GoogleFonts.roboto(
              color: Color(KOTPButtonBGColor), fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(KNavBGColor),
      body: isLoading
          ? Container(
              width: width * .8,
              child: FlareActor(
                CONTENT,
                animation: 'content_loading',
              ),
            )
          : Container(
              height: height * 0.89,
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
                        onTap: editItem,
                        textColor: KOTPButtonTextColor,
                        fontSize: 12,
                        text: 'Edit Product',
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
