import 'package:aashas/drawerHome.dart';
import 'package:aashas/main-home.dart';

import 'package:aashas/providers/CartData.dart';
import 'package:aashas/providers/Favourites.dart';
import 'package:aashas/providers/Orders.dart';
import 'package:aashas/providers/Products_Provider.dart';
import 'package:aashas/providers/Users.dart';
import 'package:aashas/providers/desginer.dart';
import 'package:aashas/providers/salesBanner.dart';
import 'package:aashas/screens/1-Welcome_Screen/Initial-Screen.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/OTP-Screen.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/Register-Screen.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/Welcome-Screen.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/mobile-Registration.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/name-registration.dart';
import 'package:aashas/screens/2-Authentication_Screen/pages/login-screen.dart';
import 'package:aashas/screens/2-Authentication_Screen/pages/mobile-login.dart';
import 'package:aashas/screens/2-Authentication_Screen/pages/otp-login.dart';
import 'package:aashas/screens/9-Cart_Screen/pages/Failed.dart';
import 'package:aashas/screens/9-Cart_Screen/pages/Payment.dart';
import 'package:aashas/screens/9-Cart_Screen/pages/Shipping.dart';
import 'package:aashas/screens/9-Cart_Screen/pages/Success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'helpers/utils/Class_Builders.dart';
import 'models/product-model.dart';

void main() {
  ClassBuilder.registerClasses();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Users()),
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Product()),
        ChangeNotifierProvider.value(value: Designer()),
        ChangeNotifierProxyProvider<Users, CartData>(
          builder: (ctx, data, prevData) => CartData(data),
        ),
        ChangeNotifierProxyProvider<Users, Favourites>(
          builder: (ctx, data, prevData) => Favourites(data),
        ),
        ChangeNotifierProxyProvider<Users, Orders>(
          builder: (ctx, data, prevData) => Orders(data),
        ),
//        ChangeNotifierProvider.value(value: CartData()),
        ChangeNotifierProvider.value(value: SalesBanners()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Home.routeName,
        routes: {
          Home.routeName: (context) => Home(),
          MainHome.routeName: (context) => MainHome(),
          DrawerHome.routeName: (context) => DrawerHome(),
          WelcomeScreen.routeName: (context) => WelcomeScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          MobileRegistrationScreen.routeName: (context) =>
              MobileRegistrationScreen(),
          MobileLoginScreen.routeName: (context) => MobileLoginScreen(),
          NameRegistrationScreen.routeName: (context) =>
              NameRegistrationScreen(),
          OTPLoginScreen.routeName: (context) => OTPLoginScreen(),
          OTPScreen.routeName: (context) => OTPScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          ShippingPage.routeName: (context) => ShippingPage(),
          PaymentPage.routeName: (context) => PaymentPage(),
          SuccessPage.routeName: (context) => SuccessPage(),
          FailedPage.routeName: (context) => FailedPage(),
        },
      ),
    );
  }
}
