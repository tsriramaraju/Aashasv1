import 'package:aashas/components/Button.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/models/cart-model.dart';
import 'package:aashas/providers/CartData.dart';
import 'package:aashas/screens/9-Cart_Screen/pages/Shipping.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_slide_animation/number_slide_animation.dart';
import 'package:provider/provider.dart';

import 'components/CartItemTile.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> items;
  int sum = 0;
  bool checkAll = false;

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
    final cart = Provider.of<CartData>(context);
    await cart.fetchAndSetCart();
    items = cart.items;
    setState(() {
      isLoading = false;
    });
  }

  void _handleCheckout() {
    Navigator.pushNamed(context, ShippingPage.routeName);
  }

  bool delLoading = false;
  void deleteAll() async {
    setState(() {
      delLoading = true;
    });
    final res = await Provider.of<CartData>(context).deleteAll();
    setState(() {
      delLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    sum = 123;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.dark.copyWith();
    return AnnotatedRegion(
      value: _currentStyle,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(KOTPButtonBGColor)),
          bottom: PreferredSize(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
//                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Cart',
                    style: GoogleFonts.raleway(
                        color: Color(KOTPButtonBGColor),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              preferredSize: Size.fromHeight(25)),
        ),
        body: isLoading
            ? CircularProgressIndicator()
            : Container(
                height: height * 0.76,
//          color: Colors.red[200],
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Color(KOTPButtonBGColor),
                              value: checkAll,
                              onChanged: (value) {
                                setState(() {
                                  checkAll = value;
                                });
                              },
                            ),
                            Text(
                              'Select all products (5)',
                              style: GoogleFonts.raleway(
                                  color:
                                      Color(KOTPButtonBGColor).withOpacity(0.6),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        checkAll
                            ? FlatButton(
                                onPressed: () {
                                  checkAll = false;
                                  deleteAll();
                                },
                                child: delLoading
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'Delete',
                                        style: GoogleFonts.raleway(
                                            color: Color(KOTPButtonBGColor),
                                            fontWeight: FontWeight.w800),
                                        textAlign: TextAlign.right,
                                      ),
                              )
                            : Container()
                      ],
                    ),
                    Container(
                      height: height * 0.695,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) => CartItemTile(
                          height: height,
                          width: width,
                          checkAll: checkAll,
                          img: items[index].img,
                          id: items[index].id,
                          size: items[index].size,
                          title: items[index].title,
                          price: items[index].price,
                          qty: items[index].qty,
                        ),
                      ),
                    )
                  ],
                ),
              ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: height * 0.1,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Total Price',
                          style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color:
                                  Color(KOTPButtonBGColor).withOpacity(0.6))),
                      Row(
                        children: [
                          Text(
                            '\$ ',
                            style: GoogleFonts.roboto(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(KOTPButtonBGColor)),
                          ),
                          NumberSlideAnimation(
                            number: sum.toString(),
                            duration: Duration(seconds: 1),
                            textStyle: GoogleFonts.roboto(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(KOTPButtonBGColor)),
                          ),
                        ],
                      )
                    ],
                  )),
              buildButton(
                  onTap: _handleCheckout,
                  width: width * 0.4,
                  bgColor: KOTPButtonBGColor,
                  textColor: KHCSButtonTextColor,
                  text: 'Checkout',
                  elevation: false)
            ],
          ),
        ),
      ),
    );
  }
}
