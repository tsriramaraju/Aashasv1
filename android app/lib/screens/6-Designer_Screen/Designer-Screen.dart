import 'package:aashas/screens/6-Designer_Screen/DesignerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DesignerScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Function onMenuPressed;

  DesignerScreen({
    this.navigatorKey,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.dark;

    return AnnotatedRegion(
      value: _currentStyle,
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return Container(
                child: DesignerPage(
                  onMenuPressed: onMenuPressed,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
