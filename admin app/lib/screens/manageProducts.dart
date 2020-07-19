import 'package:admin/helpers/Images.dart';
import 'package:admin/helpers/colors.dart';
import 'package:admin/models/product-model.dart';
import 'package:admin/providers/Products_Provider.dart';
import 'package:admin/screens/ProductPage.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageProducts extends StatefulWidget {
  static const routeName = '/manage-product';
  @override
  _ManageProductsState createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
  bool isLoading = false;
  var _isInit = true;
  List<Product> items;
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
      items = [];
      await loadItems();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> loadItems() async {
    final prods = Provider.of<Products>(context);

    await prods.fetAndSetProducts();
    items = prods.products;
    setState(() {
      itemsCount = items.length;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(KDrawerBGColor),
        title: Text('Manage Products'),
      ),
      body: isLoading
          ? Container(
              height: double.infinity,
              width: double.infinity,
              child: FlareActor(
                LOADING,
                animation: "Loading",
              ),
            )
          : ListView(
              padding: EdgeInsets.all(15),
              physics: BouncingScrollPhysics(),
              children: [
                ...items.map(
                  (e) => Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage(id: e.id)));
                      },
                      title: Text(e.name),
                      leading: Image.network(e.images[0]),
                      trailing: Text(
                        e.price.toString(),
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                      contentPadding: EdgeInsets.all(5),
                      subtitle: Text(
                        e.description,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
