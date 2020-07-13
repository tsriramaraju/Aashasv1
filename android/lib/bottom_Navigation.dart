import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'helpers/constants/colors.dart';

enum TabItem { category, shop, custom, designer }

Map<TabItem, String> tabName = {
  TabItem.category: 'Category',
  TabItem.shop: 'Shop',
  TabItem.custom: 'Custom',
  TabItem.designer: 'Designer',
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  Color _colorTabMatching({TabItem item}) {
    return currentTab == item
        ? Color(KNavActiveIconColor)
        : Color(KNavInActiveIconColor).withOpacity(0.9);
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Color(KNavColor),
      buttonBackgroundColor: Color(KNavButtonBGColor),
      height: 55,
      index: currentTab.index,
      animationDuration: Duration(milliseconds: 800),
      backgroundColor: Color(KNavBGColor),
      items: <Widget>[
        Icon(
          Icons.home,
          color: _colorTabMatching(item: TabItem.category),
        ),
        Icon(
          FontAwesomeIcons.shoppingBag,
          color: _colorTabMatching(item: TabItem.shop),
        ),
        Icon(
          FontAwesomeIcons.cut,
          color: _colorTabMatching(item: TabItem.custom),
        ),
        Icon(
          FontAwesomeIcons.rulerCombined,
          color: _colorTabMatching(item: TabItem.designer),
        ),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }
}
