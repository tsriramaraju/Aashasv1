import 'package:admin/components/ORdersTile.dart';
import 'package:admin/helpers/Images.dart';
import 'package:admin/helpers/colors.dart';
import 'package:admin/models/order-model.dart';
import 'package:admin/providers/Orders.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  static const routeName = '/view-orders';
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
    final ords = Provider.of<Orders>(context, listen: true);

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
    final ord = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(KDrawerBGColor),
        title: Text('Total Orders'),
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
                          : Flexible(
                              child: ListView(
                                physics: BouncingScrollPhysics(),
                                children: [
                                  ...ord.orders.map(
                                    (e) => OrderItemTile(
                                      update: ord.updateStatus,
                                      id: e.id,
                                      height: height,
                                      width: width,
                                      estDays: (e.estDelivery
                                              .difference(DateTime.now())
                                              .inDays)
                                          .toString(),
                                      status: e.status,
                                      orderedDays: (DateTime.now()
                                              .difference(e.orderedData)
                                              .inDays)
                                          .toString(),
                                      mobile: e.mobile,
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
