import 'package:aashas/bottom_Navigation.dart';
import 'package:aashas/providers/Products_Provider.dart';
import 'package:aashas/providers/Users.dart';
import 'package:aashas/screens/10-Favourite_Screen/Favourite-Screen.dart';
import 'package:aashas/screens/3-Category_Screen/Category-Screen.dart';
import 'package:aashas/screens/4-Shop_Screen/Shop-Screen.dart';
import 'package:aashas/screens/4-Shop_Screen/pages/AllProductsPage.dart';
import 'package:aashas/screens/5-Cutsom_order_screen/CustomOrder-Screen.dart';
import 'package:aashas/screens/6-Designer_Screen/Designer-Screen.dart';
import 'package:aashas/screens/9-Cart_Screen/Cart-Screen.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainHome extends KFDrawerContent {
  static const routeName = '/main-home';
  @override
  _NavigationHomeState createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<MainHome> {
  TabItem _currentTab = TabItem.category;
  DateTime currentBackPressTime;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.category: GlobalKey<NavigatorState>(),
    TabItem.shop: GlobalKey<NavigatorState>(),
    TabItem.custom: GlobalKey<NavigatorState>(),
    TabItem.designer: GlobalKey<NavigatorState>(),
  };
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final products = Products();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    print("letsee");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("from main destroy");
  }

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  void _handleShop(Map<String, String> index) {
    final items = products.filterProducts(index['category'],
        subFilter: index['subCategory']);
    _navigatorKeys[TabItem.category]
        .currentState
        .popUntil((route) => route.isFirst);
    _navigatorKeys[TabItem.shop]
        .currentState
        .popUntil((route) => route.isFirst);
    setState(() {
      _currentTab = TabItem.shop;
      _navigatorKeys[TabItem.shop].currentState.push(MaterialPageRoute(
            builder: (context) => AllProducts(
              filter: index['category'],
              subFilter: index['subCategory'],
              onCartPressed: _handleCart,
              onFavouritesPressed: _handleFavourite,
//              products: items,
            ),
          ));
    });
  }

  void _handleCart() {
    Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => CartScreen(),
        ));
  }

  void _handleFavourite() {
    Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => FavouriteScreen(),
        ));
  }

  void _load(BuildContext context) async {
    final products = Provider.of<Products>(context);
    final prod = products.products;
    prod.forEach((element) {
      print(element.name);
    });
//    await products.fetAndSetProducts();
  }

  void _handleMenu() {
    widget.onMenuPressed();
  }

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.transparent,
//    ));
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.category) {
            // select 'main' tab
            _selectTab(TabItem.category);
            // back button handled by app
            return false;
          } else {
            DateTime now = DateTime.now();
            if (currentBackPressTime == null ||
                now.difference(currentBackPressTime) > Duration(seconds: 2)) {
              currentBackPressTime = now;
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('Press one more time to exit'),
                duration: Duration(seconds: 1),
              ));
              return Future.value(false);
            }
            return Future.value(true);
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: isLoading
          ? LinearProgressIndicator()
          : Scaffold(
              key: _scaffoldKey,
//              floatingActionButton:
//                  FloatingActionButton(onPressed: () => _load(context)),
              body: Stack(
                children: [
                  _buildOffstagePage(
                      tabItem: TabItem.shop,
                      child: ShopScreen(
                        navigatorKey: _navigatorKeys[TabItem.shop],
                        onMenuPressed: _handleMenu,
                        onCartPressed: _handleCart,
                        onFavouritesPressed: _handleFavourite,
                      )),
                  _buildOffstagePage(
                      tabItem: TabItem.custom,
                      child: CustomOrderScreen(
                        onMenuPressed: _handleMenu,
                        navigatorKey: _navigatorKeys[TabItem.custom],
                      )),
                  _buildOffstagePage(
                      tabItem: TabItem.category,
                      child: CategoryScreen(
                        navigatorKey: _navigatorKeys[TabItem.category],
                        handleShop: _handleShop,
                        onFavouritesPressed: _handleFavourite,
                        onMenuPressed: _handleMenu,
                        onCartPressed: _handleCart,
                      )),
                  _buildOffstagePage(
                      child: DesignerScreen(
                        onMenuPressed: _handleMenu,
                        navigatorKey: _navigatorKeys[TabItem.designer],
                      ),
                      tabItem: TabItem.designer),
                ],
              ),
              bottomNavigationBar: BottomNavigation(
                currentTab: _currentTab,
                onSelectTab: _selectTab,
              ),
            ),
    );
  }

  Widget _buildOffstagePage({TabItem tabItem, Widget child}) {
    return Offstage(offstage: _currentTab != tabItem, child: child);
  }
}
