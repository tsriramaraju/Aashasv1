import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/screens/6-Designer_Screen/BlogsScreen.dart';
import 'package:aashas/screens/6-Designer_Screen/Messages.dart';
import 'package:aashas/screens/7-User_profile_Screen/NotificationsScreen.dart';
import 'package:aashas/screens/8-Order_Screen/OrderScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'helpers/utils/Class_Builders.dart';

class DrawerHome extends StatefulWidget {
  static const routeName = '/drawer-home';
  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('MainHome'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text(
            'Home',
            style: GoogleFonts.roboto(
                color: Color(KDrawerTextColor).withOpacity(0.5), fontSize: 16),
          ),
          icon: Icon(Icons.home, color: Color(KDrawerIconColor)),
          page: ClassBuilder.fromString('MainHome'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Notifications',
            style: GoogleFonts.roboto(
                color: Color(KDrawerTextColor).withOpacity(0.5), fontSize: 16),
          ),
          icon: Icon(Icons.notifications, color: Color(KDrawerIconColor)),
          page: NotificationsScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Messages',
            style: GoogleFonts.roboto(
                color: Color(KDrawerTextColor).withOpacity(0.5), fontSize: 16),
          ),
          icon: Icon(Icons.message, color: Color(KDrawerIconColor)),
          page: MessagesScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Orders',
            style: GoogleFonts.roboto(
                color: Color(KDrawerTextColor).withOpacity(0.5), fontSize: 16),
          ),
          icon: Icon(Icons.shopping_cart, color: Color(KDrawerIconColor)),
          page: OrdersScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Blog',
            style: GoogleFonts.roboto(
                color: Color(KDrawerTextColor).withOpacity(0.5), fontSize: 16),
          ),
          icon:
              Icon(Icons.collections_bookmark, color: Color(KDrawerIconColor)),
          page: BlogsScreen(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.transparent,
//    ));
    return Scaffold(
      body: KFDrawer(
        drawerWidth: 0.6,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.only(top: 35),
            width: MediaQuery.of(context).size.width * 0.5,
            child: SvgPicture.asset(
              KLogoFull,
              color: Color(KDrawerLogoColor),
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'Log out',
            style: TextStyle(color: Color(KDrawerTextColor)),
          ),
          icon: Icon(
            Icons.input,
            color: Color(KDrawerIconColor),
          ),
          onPressed: () {},
        ),
        decoration: BoxDecoration(color: Color(KDrawerBGColor)),
      ),
    );
  }
}
