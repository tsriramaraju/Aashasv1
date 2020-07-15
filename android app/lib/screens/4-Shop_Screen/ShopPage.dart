import 'package:aashas/providers/Products_Provider.dart';
import 'package:aashas/screens/4-Shop_Screen/components/AllProductsBlock.dart';
import 'package:aashas/screens/4-Shop_Screen/components/TopTrendsBlock.dart';
import 'package:aashas/screens/4-Shop_Screen/pages/AllProductsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/DesignerCollectionBlock.dart';
import 'components/ShopOfferBanner.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({
    Key key,
    @required this.height,
    @required this.onMenuPressed,
    @required this.width,
    @required this.onFavouritesPressed,
    @required this.onCartPressed,
  }) : super(key: key);

  final double height;
  final double width;

  final Function onMenuPressed;
  final Function onFavouritesPressed;
  final Function onCartPressed;

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool isLoading = false;
  var _isInit = true;
  var _productsData;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      print("shop screen init state");
      await loadItems();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> loadItems() async {
    final prods = Provider.of<Products>(context);
    await prods.fetAndSetProducts();
    _productsData = prods;
    setState(() {
      isLoading = false;
    });
  }

  void _showAllProducts(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AllProducts(
//            products: _products.products,
            onFavouritesPressed: widget.onFavouritesPressed,
            onCartPressed: widget.onFavouritesPressed,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ShopOfferBanner(widget: widget),
        Container(
          height: widget.height * 0.70,
          child: isLoading
              ? CircularProgressIndicator()
              : ListView(
                  children: [
                    DesignerCollectionBlock(
                      onFavouritePressed: widget.onFavouritesPressed,
                      onCartPressed: widget.onCartPressed,
                      showAllProducts: _showAllProducts,
                      items: _productsData.designerProducts,
                      width: widget.width,
                      height: widget.height,
                    ),
                    TopTrendsBlock(
                      onFavouritePressed: widget.onFavouritesPressed,
                      onCartPressed: widget.onCartPressed,
                      showAllProducts: _showAllProducts,
                      width: widget.width,
                      height: widget.height,
                      items: _productsData.topTrends,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AllProductsBlock(
                      onFavouritePressed: widget.onFavouritesPressed,
                      onCartPressed: widget.onCartPressed,
                      showAllProducts: _showAllProducts,
                      width: widget.width,
                      height: widget.height,
                      items: _productsData.filterProducts(null),
                    ),
                  ],
                ),
        )
      ],
    ));
  }
}
