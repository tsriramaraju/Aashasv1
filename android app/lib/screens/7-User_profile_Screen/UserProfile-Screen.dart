import 'package:aashas/helpers/constants/Images.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../../drawerHome.dart';

class UserProfileScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () {
          return Navigator.of(context)
              .pushReplacementNamed(DrawerHome.routeName);
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: height * 0.65,
                  width: width,
                  child: FlareActor(
                    CODING,
                    fit: BoxFit.cover,
                    animation: "Wave",
                  )),
              Text(
                "Oops, you found out. This feature is not ready yet",
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(DrawerHome.routeName);
                },
                child: Text(
                  "Go back to Home Screen",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.teal.withOpacity(0.5),
                padding: EdgeInsets.all(20),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}
