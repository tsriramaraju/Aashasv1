import 'package:aashas/drawerHome.dart';
import 'package:aashas/providers/CartData.dart';
import 'package:aashas/screens/1-Welcome_Screen/Initial-Screen.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/OTP-Screen.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/Register-Screen.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/Welcome-Screen.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/mobile-Registration.dart';
import 'package:aashas/screens/1-Welcome_Screen/pages/name-registration.dart';
import 'package:aashas/screens/2-Authentication_Screen/pages/login-screen.dart';
import 'package:aashas/screens/9-Cart_Screen/pages/Failed.dart';
import 'package:aashas/screens/9-Cart_Screen/pages/Payment.dart';
import 'package:aashas/screens/9-Cart_Screen/pages/Shipping.dart';
import 'package:aashas/screens/9-Cart_Screen/pages/Success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'helpers/utils/Class_Builders.dart';

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
      providers: [ChangeNotifierProvider.value(value: CartData())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Home.routeName,
        routes: {
          Home.routeName: (context) => Home(),
          DrawerHome.routeName: (context) => DrawerHome(),
          WelcomeScreen.routeName: (context) => WelcomeScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          MobileRegistrationScreen.routeName: (context) =>
              MobileRegistrationScreen(),
          NameRegistrationScreen.routeName: (context) =>
              NameRegistrationScreen(),
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
