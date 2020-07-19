import 'package:admin/dashboard.dart';
import 'package:admin/providers/Designer.dart';
import 'package:admin/providers/Orders.dart';
import 'package:admin/providers/Products_Provider.dart';
import 'package:admin/providers/Users.dart';
import 'package:admin/screens/Success.dart';
import 'package:admin/screens/addProducts.dart';
import 'package:admin/screens/deletedMsg.dart';
import 'package:admin/screens/editProduct.dart';
import 'package:admin/screens/loginScreen.dart';
import 'package:admin/screens/manageProducts.dart';
import 'package:admin/screens/updateBio.dart';
import 'package:admin/screens/viewOrders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Users()),
        ChangeNotifierProxyProvider<Users, Products>(
          builder: (ctx, data, prevData) => Products(data),
        ),
        ChangeNotifierProxyProvider<Users, Orders>(
          builder: (ctx, data, prevData) => Orders(data),
        ),
        ChangeNotifierProxyProvider<Users, Designer>(
          builder: (ctx, data, prevData) => Designer(data),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          Dashboard.routeName: (context) => Dashboard(),
          SuccessPage.routeName: (context) => SuccessPage(),
          AddProductScreen.routeName: (context) => AddProductScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
          DeletedPage.routeName: (context) => DeletedPage(),
          OrdersPage.routeName: (context) => OrdersPage(),
          UpdateBio.routeName: (context) => UpdateBio(),
          ManageProducts.routeName: (context) => ManageProducts()
        },
      ),
    );
  }
}
