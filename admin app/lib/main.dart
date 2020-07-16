import 'package:admin/dashboard.dart';
import 'package:admin/providers/Users.dart';
import 'package:admin/screens/loginScreen.dart';
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
          Dashboard.routeName: (context) => Dashboard()
        },
      ),
    );
  }
}
