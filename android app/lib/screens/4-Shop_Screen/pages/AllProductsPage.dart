import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/models/product-model.dart';
import 'package:aashas/providers/Products_Provider.dart';
import 'package:aashas/screens/4-Shop_Screen/components/ProductsTileSmall.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

enum FilterOptions { all, male, female, kids }

class AllProducts extends StatefulWidget {
  final Function onCartPressed;
  final Function onFavouritesPressed;
  final String filter;
  final String subFilter;

  AllProducts(
      {this.onCartPressed,
      this.onFavouritesPressed,
      this.filter,
      this.subFilter});

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
//  final productsData = Products();
  List<Product> items;
  String filter;

  bool isLoading = false;
  var _isInit = true;
  @override
  void initState() {
    super.initState();
  }

  int itemsCount = 0;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      print("All products init state");
      filter = widget.filter;
      items = [];
      await loadItems();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> loadItems() async {
    final prods = Provider.of<Products>(context);

    items = prods.filterProducts(widget.filter, subFilter: widget.subFilter);
    if (items == []) await prods.fetAndSetProducts();
    setState(() {
      itemsCount = items.length;
      isLoading = false;
    });
  }

  void _handleChanges(String index) {
    setState(() {
      filter = index;
      final prods = Provider.of<Products>(context);
      items = prods.filterProducts(index);
      itemsCount = items.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light));
    return Scaffold(
      backgroundColor: Color(KNavButtonBGColor),
      appBar: AppBar(
        backgroundColor: Color(KNavButtonBGColor),
        elevation: 0,
        actions: [
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Color(KWSTitleColor),
                  ),
                  onPressed: widget.onFavouritesPressed),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Color(KWSTitleColor),
                ),
                onPressed: widget.onCartPressed,
              )
            ],
          )
        ],
        iconTheme: IconThemeData(
          color: Color(KCSTitleColor),
        ),
        brightness: Brightness.light,
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.09,
            padding: EdgeInsets.only(top: 15, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      filter == null ? 'All products' : filter,
                      style: GoogleFonts.roboto(
                          color: Color(KOTPButtonBGColor),
                          fontSize: height * 0.0275,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '$itemsCount items found',
                      style: GoogleFonts.roboto(
                          color: Color(KOTPButtonBGColor).withOpacity(0.5),
                          fontSize: height * 0.0175,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                PopupMenuButton(
                  onSelected: (val) {
                    if (val == FilterOptions.male)
                      _handleChanges('male');
                    else if (val == FilterOptions.female)
                      _handleChanges('female');
                    else if (val == FilterOptions.kids)
                      _handleChanges('kids');
                    else if (val == FilterOptions.all) _handleChanges(null);
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text(
                        'all',
                      ),
                      value: FilterOptions.all,
                    ),
                    PopupMenuItem(
                      child: Text(
                        'male',
                      ),
                      value: FilterOptions.male,
                    ),
                    PopupMenuItem(
                      child: Text(
                        'female',
                      ),
                      value: FilterOptions.female,
                    ),
                    PopupMenuItem(
                        child: Text(
                          'kids',
                        ),
                        value: FilterOptions.kids),
                  ],
                  icon: Icon(
                    Icons.more_horiz,
                  ),
                )
              ],
            ),
          ),
          isLoading
              ? Container(
                  height: height * 0.5,
                  child: FlareActor(
                    LOADING,
                    animation: 'Loading',
                  ),
                )
              : Container(
//            color: Colors.blueGrey,
                  height: height * 0.725,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1 / 1.8),
                    padding: EdgeInsets.all(10),
                    physics: BouncingScrollPhysics(),
                    children: [
                      ...items.map((index) {
                        return ProductsTile(
                          id: index.id,
                          onCartPressed: widget.onCartPressed,
                          onFavouritePressed: widget.onFavouritesPressed,
                          height: height,
                          width: width,
                          isNew: index.isNew,
                          price: index.price,
                          isFavourite: index.isFavourite,
                          img: index.images[0],
                          title: index.name,
                        );
                      }).toList()
                    ],
                  )
//              Consumer<Products>(builder: (ctx, data, child) {
//                return
//              })
                  ),
        ],
      ),
    );
  }
}
