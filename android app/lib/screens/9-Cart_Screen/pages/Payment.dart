import 'package:aashas/components/Button.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/models/cart-model.dart';
import 'package:aashas/providers/Orders.dart';
import 'package:aashas/screens/9-Cart_Screen/components/PaymentOrderIItems.dart';
import 'package:aashas/screens/9-Cart_Screen/pages/Success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'Failed.dart';

class PaymentPage extends StatefulWidget {
  static const routeName = '/payment';

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
//  static const platform = const MethodChannel("razorpay_flutter");
  Razorpay _razorPay;
  bool isLoading = false;
  var _isInit = true;
  @override
  void initState() {
    super.initState();
    _razorPay = Razorpay();
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      print("Payment Page init state");
      await loadItem();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  var args;
  int cartCount = 0;
  Future<void> loadItem() async {
    args = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    items = args["items"];
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _razorPay.clear();
  }

  List<Cart> items = [];
  bool paymentLoading = false;
  void _handleCheckout() async {
    setState(() {
      paymentLoading = true;
    });
    final orders = Provider.of<Orders>(context);
    await orders.addOrder(
        address: args["address"],
        city: args["city"],
        country: args["country"],
        email: args["email"],
        finalAmount: 22,
//        (args["sum"] + 250),
        home: args["address"],
        items: args["items"],
        mobile: 55625,
//        args["mobile"],
        note: args["note"],
        pinCode: 2132121,
//        args["zipCode"],
//        shipping: 250,
        state: "AP",
        total: 21212
//        args["sum"]
        );
    setState(() {
      paymentLoading = false;
    });

//    print(items);
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_FaEiuuoiYoG9ck',
      'amount': args["sum"],
      'name': 'Aasha\'s Boutique.',
      'description': 'Designer Collection',
      'prefill': {'contact': args["mobile"], 'email': args["email"]},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorPay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.pushNamed(context, SuccessPage.routeName);
//    Fluttertoast.showToast(
//        msg: "SUCCESS: " + response.paymentId, timeInSecForIos: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Navigator.pushNamed(context, FailedPage.routeName);
//    Fluttertoast.showToast(
//        msg: "ERROR: " + response.code.toString() + " - " + response.message,
//        timeInSecForIos: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // ignore: deprecated_member_use
    // Fluttertoast.showToast(

    //     ,gravity: ToastGravity.BOTTOM, toastDuration: 4);
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
          title: Text(
            'Checkout',
            style: GoogleFonts.roboto(
                color: Color(KOTPButtonBGColor),
                fontSize: 21,
                fontWeight: FontWeight.w500),
          ),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(KOTPButtonBGColor),
          ),
          bottom: PreferredSize(
              child: Container(
                height: height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(KOTPButtonBGColor),
                    ),
                    Text(
                      '. . . .',
                      style: GoogleFonts.roboto(
                        color: Color(KOTPButtonBGColor),
                        fontSize: 30,
                      ),
                    ),
                    Icon(
                      Icons.credit_card,
                      color: Color(KOTPButtonBGColor),
                    ),
                    Text(
                      '. . . .',
                      style: GoogleFonts.roboto(
                          color: Color(KOTPButtonBGColor).withOpacity(0.5),
                          fontSize: 30),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Color(KOTPButtonBGColor).withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(height * 0.08)),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: height * 0.5,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Step 2',
                style: GoogleFonts.roboto(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment',
                    style: GoogleFonts.roboto(
                        color: Color(KOTPButtonBGColor),
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Order Details',
                    style: GoogleFonts.roboto(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: height * 0.39,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    ...items.map(
                      (e) => PaymentOrderItemsCard(
                          height: height,
                          width: width,
                          color: e.color,
                          size: e.size,
                          price: e.price,
                          img: e.img,
                          title: e.title),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          height: height * 0.33,
          color: Colors.grey[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products Total",
                    style: GoogleFonts.roboto(
                        color: Color(KOTPButtonBGColor).withOpacity(0.7),
                        fontSize: 18),
                  ),
                  Text(
                    "\$${args["sum"]}",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: Color(KOTPButtonBGColor).withOpacity(0.9),
                        fontSize: 18),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Handling Charges",
                    style: GoogleFonts.roboto(
                        color: Color(KOTPButtonBGColor).withOpacity(0.7),
                        fontSize: 16),
                  ),
                  Text(
                    "\$4.34",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: Color(KOTPButtonBGColor).withOpacity(0.9),
                        fontSize: 16),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Service Tax 15 %",
                    style: GoogleFonts.roboto(
                        color: Color(KOTPButtonBGColor).withOpacity(0.7),
                        fontSize: 16),
                  ),
                  Text(
                    "\$8.18",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: Color(KOTPButtonBGColor).withOpacity(0.9),
                        fontSize: 16),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping Charges",
                    style: GoogleFonts.roboto(
                        color: Color(KOTPButtonBGColor).withOpacity(0.7),
                        fontSize: 16),
                  ),
                  Text(
                    "\$19.25",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: Color(KOTPButtonBGColor).withOpacity(0.9),
                        fontSize: 16),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: GoogleFonts.roboto(
                        color: Color(KOTPButtonBGColor), fontSize: 21),
                  ),
                  Text(
                    "\$599.45",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        color: Color(KOTPButtonBGColor),
                        fontSize: 21),
                  ),
                ],
              ),
              Align(
                child: buildButton(
                    onTap: _handleCheckout,
                    loading: paymentLoading,
                    width: width * 0.45,
                    text: 'Pay',
                    bgColor: KOTPButtonBGColor,
                    textColor: KHCSButtonTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
