import 'dart:io';

import 'package:admin/helpers/Button.dart';
import 'package:admin/helpers/Images.dart';
import 'package:admin/helpers/colors.dart';
import 'package:admin/models/product-model.dart';
import 'package:admin/providers/Products_Provider.dart';
import 'package:admin/screens/Success.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:path/path.dart' as path;
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'package:provider/provider.dart';

import 'deletedMsg.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

bool isNew = true;
bool offer = false;
bool trending = false;
bool designerCollection = false;
List<String> _uploadedFileURLS = [];

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _sizeFocusNode = FocusNode();
  final _titleFocusNode = FocusNode();
  final _colorsFocusNode = FocusNode();
  final _mainCatFocusNode = FocusNode();
  final _subCatFocusNode = FocusNode();

  final _descriptionFocusNode = FocusNode();
  List<Asset> images = List<Asset>();
  final _form = GlobalKey<FormState>();

  var _addedProduct = Product();
  var _isLoading = false;
  String cat = "";

  @override
  void initState() {
    super.initState();
  }

  void deleteImages(String img) {
    print("delete started");
    final inx = imgs.indexOf(img);

    imgLength--;
    setState(() {
      imgs.removeAt(inx);
    });
  }

  bool isLoading = false;
  var _isInit = true;
  int imgLength = 1;
  List<String> imgs = [];
  String id;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      print("Product Page init state");
      Product prod = ModalRoute.of(context).settings.arguments as Product;
      isNew = prod.isNew;
      designerCollection = prod.designerCollection;
      imgLength = prod.images.length;
      imgs = prod.images;
      trending = prod.trends;
      id = prod.id;
      _addedProduct = Product(
          id: prod.id,
          name: prod.name,
          colors: prod.colors,
          price: prod.price,
          description: prod.description,
          images: prod.images,
          size: prod.size,
          category: prod.category,
          designerCollection: prod.designerCollection,
          isFavourite: prod.isFavourite,
          isNew: prod.isNew,
          trends: prod.trends);
    }
    _isInit = false;
    setState(() {
      isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _sizeFocusNode.dispose();
    _colorsFocusNode.dispose();
    _mainCatFocusNode.dispose();
    _subCatFocusNode.dispose();

    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();

    super.dispose();
  }

  Future<void> fileUpload() async {
    for (File element in fileImageArray) {
      print("started uploading ${path.basename(element.path)}");
      try {
        StorageReference storageReference = FirebaseStorage.instance
            .ref()
            .child('productImages/${path.basename(element.path)}');
        StorageUploadTask uploadTask = storageReference.putFile(element);
        await uploadTask.onComplete;
      } catch (err) {
        print("error uploading file $err");
      }
    }
  }

  Future<void> getFileUrls() async {
    List<String> loadedUrls = [];
    for (File element in fileImageArray) {
      try {
        print("getting file url for ${path.basename(element.path)}");
        StorageReference storageReference = FirebaseStorage.instance
            .ref()
            .child('productImages/${path.basename(element.path)}');
        final url = await storageReference.getDownloadURL() as String;
        loadedUrls.add(url.toString());
      } catch (err) {
        print("Error while retrieving file name $err");
        return "";
      }
      _uploadedFileURLS = loadedUrls;
    }
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

    try {
      await convertAssets();

      await fileUpload();

      await getFileUrls();
      print(_uploadedFileURLS.length);
      final imgArr = _uploadedFileURLS.length < 1 ? imgs : _uploadedFileURLS;
      _addedProduct = Product(
          id: id,
          name: _addedProduct.name,
          price: _addedProduct.price,
          description: _addedProduct.description,
          size: _addedProduct.size,
          colors: _addedProduct.colors,
          category: _addedProduct.category,
          isNew: isNew,
          trends: trending,
          discount: _addedProduct.discount,
          images: imgArr,
          designerCollection: designerCollection);
      print("delete started + $_uploadedFileURLS");
      print("delete started + ${_addedProduct.id}");

//      _uploadedFileURLS.forEach((e) => print("final results $e"));

      final products = Provider.of<Products>(context);
      final result = await products.updateProduct(_addedProduct);
      if (result == "Product suceffuly Updated") {
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text(result), duration: Duration(seconds: 3)));
        Navigator.pushReplacementNamed(context, SuccessPage.routeName);
      }
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred!'),
          content: Text('Something went wrong.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
      print("error is $error");
    }

    setState(() {
      _isLoading = false;
    });
//    Navigator.of(context).pop();
  }

  void handleDelete() async {
    await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Item will deleted entirely from the DB'),
              content: Text('Are your Sure'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    final products = Provider.of<Products>(context);
                    final result = await products.deleteProduct(id);
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.of(ctx).pushNamed(DeletedPage.routeName);
                  },
                )
              ],
            ));
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 10,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  List<File> fileImageArray = [];
  Future<void> convertAssets() async {
    try {
      List<File> loadedArray = [];
      for (Asset imageAsset in images) {
        var filePath =
            await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier);

        File tempFile = File(filePath);
        if (tempFile.existsSync()) {
          loadedArray.add(tempFile);
        }
      }
      fileImageArray = loadedArray;
    } catch (err) {
      print("err in conveting assets $err");
    }
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#232429",
          actionBarTitle: "Add Pictures",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(KDrawerBGColor),
        title: Text('Edit Product'),
        actions: <Widget>[
          isLoading
              ? Container(
                  width: 100,
                  child: FlareActor(
                    LOADING,
                    animation: "Loading",
                  ),
                )
              : IconButton(
                  icon: Icon(Icons.save),
                  onPressed: _saveForm,
                ),
          isLoading
              ? Text('')
              : IconButton(
                  icon: Icon(Icons.delete_forever),
                  onPressed: handleDelete,
                )
        ],
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _addedProduct.name,
                      decoration: InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _addedProduct = Product(
                          name: value,
//                          price: _addedProduct.price,
//                          description:_addedProduct.description,
//                            img: _editedProduct.imageUrl,
//                          id: _editedProduct.id,
//                            isFavorite: _editedProduct.isFavorite
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          child: TextFormField(
                            initialValue: _addedProduct.price.toString(),
                            decoration: InputDecoration(labelText: 'Price'),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            focusNode: _priceFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_descriptionFocusNode);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a price.';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Please enter a valid number.';
                              }
                              if ((double.tryParse(value) % 1) == 0) {
                                return 'Please enter a decimal point';
                              }
                              if (double.parse(value) <= 0) {
                                return 'Please enter a number greater than zero.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _addedProduct = Product(
                                name: _addedProduct.name,
                                price: double.parse(value),
//                                description: _editedProduct.description,
//                            imageUrl: _editedProduct.imageUrl,
//                                id: _editedProduct.id,
//                            isFavorite: _editedProduct.isFavorite
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "isNew",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color(KLSTitleColor).withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Switch(
                                    value: isNew,
                                    onChanged: (value) => {
                                      setState(() {
                                        isNew = value;
                                        _addedProduct = Product(
                                            name: _addedProduct.name,
                                            price: _addedProduct.price,
                                            isNew: isNew,
                                            trends: trending,
                                            inOffer: offer,
                                            designerCollection:
                                                designerCollection);
                                      })
                                    },
                                    activeColor: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Designer",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color(KLSTitleColor).withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Switch(
                                    value: designerCollection,
                                    onChanged: (value) => {
                                      setState(() {
                                        designerCollection = value;
                                        _addedProduct = Product(
                                            name: _addedProduct.name,
                                            price: _addedProduct.price,
                                            isNew: isNew,
                                            inOffer: offer,
                                            trends: trending,
                                            designerCollection:
                                                designerCollection);
                                      })
                                    },
                                    activeColor: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Trend",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color(KLSTitleColor).withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Switch(
                                    value: trending,
                                    focusColor: Colors.red,
                                    onChanged: (value) => {
                                      setState(() {
                                        trending = value;
                                        _addedProduct = Product(
                                            name: _addedProduct.name,
                                            price: _addedProduct.price,
                                            isNew: isNew,
                                            trends: trending,
                                            inOffer: offer,
                                            designerCollection:
                                                designerCollection);
                                      })
                                    },
                                    activeColor: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    TextFormField(
                      initialValue: _addedProduct.description,
                      decoration: InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _descriptionFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a description.';
                        }
                        if (value.length < 10) {
                          return 'Should be at least 10 characters long.';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_sizeFocusNode);
                      },
                      onSaved: (value) {
                        _addedProduct = Product(
                            name: _addedProduct.name,
                            price: _addedProduct.price,
                            description: value,
                            isNew: isNew,
                            trends: trending,
                            designerCollection: designerCollection);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 110,
                          child: TextFormField(
                            initialValue: _addedProduct.size.join(' '),
                            decoration: InputDecoration(
                              labelText: 'Sizes',
                              hintText: "Use space to separate",
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 25),
                            ),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            focusNode: _sizeFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_colorsFocusNode);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Size.';
                              }

                              return null;
                            },
                            onSaved: (value) {
                              List<String> sizes = value.split(' ');
                              _addedProduct = Product(
                                  name: _addedProduct.name,
                                  price: _addedProduct.price,
                                  description: _addedProduct.description,
                                  isNew: isNew,
                                  trends: trending,
                                  designerCollection: designerCollection,
                                  size: sizes);
                            },
                          ),
                        ),
                        Container(
                          width: 200,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Colors',
                              hintText: "Separate values by space",
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 25),
                            ),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            focusNode: _colorsFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_mainCatFocusNode);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Colors.';
                              }

                              return null;
                            },
                            onSaved: (value) {
                              List<String> colors = value.split(' ');
                              _addedProduct = Product(
                                  name: _addedProduct.name,
                                  price: _addedProduct.price,
                                  description: _addedProduct.description,
                                  size: _addedProduct.size,
                                  isNew: isNew,
                                  trends: trending,
                                  colors: colors,
                                  designerCollection: designerCollection);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 130,
                          child: TextFormField(
                            initialValue: _addedProduct.category.keys.first,
                            decoration: InputDecoration(
                              labelText: 'Main Category',
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 25),
                            ),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            focusNode: _mainCatFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_subCatFocusNode);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Category.';
                              }

                              return null;
                            },
                            onSaved: (value) {
                              cat = value;
                              _addedProduct = Product(
                                  name: _addedProduct.name,
                                  price: _addedProduct.price,
                                  description: _addedProduct.description,
                                  size: _addedProduct.size,
                                  colors: _addedProduct.colors,
                                  category: {cat: []},
                                  isNew: isNew,
                                  trends: trending,
                                  designerCollection: designerCollection);
                            },
                          ),
                        ),
                        Container(
                          width: 210,
                          child: TextFormField(
                            initialValue: _addedProduct
                                .category[_addedProduct.category.keys.first]
                                .join(' '),
                            decoration: InputDecoration(
                                labelText: 'Sub Categories',
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 25),
                                hintText: "Separate values by space"),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            focusNode: _subCatFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).unfocus();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Sub Category.';
                              }

                              return null;
                            },
                            onSaved: (value) {
                              List<String> sub = value.split(' ');
                              _addedProduct = Product(
                                  name: _addedProduct.name,
                                  price: _addedProduct.price,
                                  description: _addedProduct.description,
                                  size: _addedProduct.size,
                                  colors: _addedProduct.colors,
                                  category: {cat: sub},
                                  isNew: isNew,
                                  trends: trending,
                                  designerCollection: designerCollection);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: imgLength < 3 ? 350 : (imgLength / 2) * 250,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(KCSCardColor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                          )
                        ],
                      ),
                      child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1 / 2,
                          children: [
                            ...imgs.map((e) {
                              return GridTile(
                                  footer: GestureDetector(
                                    onTap: () => deleteImages(e),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.65),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Delete",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                      child: Image.network(
                                        e,
                                        fit: BoxFit.cover,
                                      )));
                            })
                          ]),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    buildButton(
                        width: double.infinity,
                        bgColor: KDrawerBGColor,
                        elevation: true,
                        fontSize: 18,
                        text: "Add Images",
                        onTap: loadAssets,
                        radius: 15,
                        loading: _isLoading,
                        textColor: KBGColor),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                        height:
                            images.length == 0 ? 10 : (images.length / 3) * 200,
                        child: buildGridView()),
                  ],
                ),
              ),
            ),
    );
  }
}
