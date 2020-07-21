import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/models/order-model.dart';
import 'package:aashas/providers/Orders.dart';
import 'package:aashas/screens/10-Favourite_Screen/components/FavouriteITemTIle.dart';
import 'package:aashas/screens/5-Cutsom_order_screen/components/ORdersTile.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomOrderPage extends StatefulWidget {
  final Function onMenuPressed;
  CustomOrderPage({this.onMenuPressed});
  @override
  _CustomOrderPageState createState() => _CustomOrderPageState();
}

class _CustomOrderPageState extends State<CustomOrderPage> {
  bool isLoading = false;
  var _isInit = true;
  var _productsData;
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
      print("Custom Orders init state");
      await loadItems();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  List<Order> orders = [];
  Future<void> loadItems() async {
    final ords = Provider.of<Orders>(context);

    await ords.fetchAndSetOrders();
    orders = ords.orders;
    setState(() {
      isLoading = false;
    });
    print(orders);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: widget.onMenuPressed,
          color: Color(KCSTitleColor),
        ),
        backgroundColor: Color(KWSBGColor),
        brightness: Brightness.light,
        elevation: 0,
        title: Text(
          "My Orders",
          style: GoogleFonts.roboto(color: Color(KWSTitleColor)),
        ),
      ),
      body: isLoading
          ? Container(
              height: height * 0.8,
              child: FlareActor(
                LOADING,
                animation: "Loading",
              ),
            )
          : orders.length > 0
              ? Container(
                  width: double.infinity,
//            color: Colors.grey,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${orders.length} orders found',
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
                              height: height * 0.70,
                              child: ListView(
                                physics: BouncingScrollPhysics(),
                                children: [
                                  ...orders.map(
                                    (e) => OrderItemTile(
                                      height: height,
                                      width: width,
                                      estDays: (e.estDelivery
                                              .difference(DateTime.now())
                                              .inDays)
                                          .toString(),
                                      status: e.status,
                                      img: e.img,
                                      price: e.price,
                                    ),
                                  )
                                ],
                              ),
                            )
                    ],
                  ),
                )
              : Column(
                  children: [
                    Container(
                      height: height * 0.7,
                      child: FlareActor(TREE, animation: "Swing"),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text("No, Orders yet. Please Add some",
                          style: GoogleFonts.roboto(fontSize: 18)),
                    )
                  ],
                ),
    );
  }
}
