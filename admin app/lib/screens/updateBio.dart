import 'dart:io';

import 'package:admin/helpers/Button.dart';
import 'package:admin/helpers/colors.dart';
import 'package:admin/models/product-model.dart';
import 'package:admin/providers/Designer.dart';
import 'package:admin/providers/Products_Provider.dart';
import 'package:admin/screens/Success.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:path/path.dart' as path;
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'package:provider/provider.dart';

class UpdateBio extends StatefulWidget {
  static const routeName = '/update-bio';

  @override
  _UpdateBioState createState() => _UpdateBioState();
}

bool isNew = true;
bool offer = false;
bool trending = false;
bool designerCollection = false;
List<String> _uploadedFileURLS = [];

class _UpdateBioState extends State<UpdateBio> {
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _mobileFocusNode = FocusNode();
  final _bioFocusNode = FocusNode();
  List<Asset> images = List<Asset>();
  final _form = GlobalKey<FormState>();
  var _designerData = {
    "name": "",
    "bio": "",
    "email": "",
    "mobile": 0,
    "img": ""
  };
  var _isLoading = false;
  String cat = "";

  @override
  void initState() {
    super.initState();
  }

  var _isInit = true;
  bool isLoading = false;
  String id;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      print("Update Bio init state");
      final designer = Provider.of<Designer>(context);
      await designer.fetchAndSetDesigner();
      _designerData = {
        "name": designer.name,
        "mobile": designer.mobile,
        "email": designer.email,
        "img": designer.img,
        "bio": designer.bio
      };
      _isInit = false;
      print(_designerData);
      setState(() {
        isLoading = false;
      });
      super.didChangeDependencies();
    }
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _bioFocusNode.dispose();
    _mobileFocusNode.dispose();
    _emailFocusNode.dispose();

    super.dispose();
  }

  Future<void> fileUpload() async {
    for (File element in fileImageArray) {
      print("started uploading ${path.basename(element.path)}");
      try {
        StorageReference storageReference = FirebaseStorage.instance
            .ref()
            .child('designer/${path.basename(element.path)}');
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
            .child('designer/${path.basename(element.path)}');
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
      print(_uploadedFileURLS[0]);
      _designerData = {
        "name": _designerData["name"],
        "email": _designerData["email"],
        "mobile": _designerData["mobile"],
        "bio": _designerData["bio"],
        "img": _uploadedFileURLS[0]
      };

      final designer = Provider.of<Designer>(context);
      final result = await designer.updateDesigner(_designerData);
      if (result == "Designer successfuly updated") {
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text(result), duration: Duration(seconds: 3)));
        Navigator.pushReplacementNamed(context, SuccessPage.routeName,
            arguments: "bio");
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
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#232429",
          actionBarTitle: "Add Picture",
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
        title: Text('Update Bio'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
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
                      initialValue: _designerData["name"],
                      decoration: InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_mobileFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a valid name.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _designerData["name"] = value;
                      },
                    ),
                    Container(
                      width: 100,
                      child: TextFormField(
                        initialValue: _designerData["mobile"].toString(),
                        decoration: InputDecoration(labelText: 'mobile'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        focusNode: _mobileFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_emailFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter number.';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number.';
                          }

                          if (double.parse(value) <= 0 &&
                              double.parse(value) < 11) {
                            return 'Please enter 10 digits';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _designerData["mobile"] = int.parse(value);
                        },
                      ),
                    ),
                    TextFormField(
                      initialValue: _designerData["email"],
                      decoration: InputDecoration(labelText: 'email'),
                      keyboardType: TextInputType.emailAddress,
                      focusNode: _emailFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid email.';
                        }
                        if (value.length < 5) {
                          return 'Please enter a valid email.';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_bioFocusNode);
                      },
                      onSaved: (value) {
                        _designerData["email"] = value;
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      initialValue: _designerData["bio"],
                      decoration: InputDecoration(labelText: 'bio'),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      focusNode: _bioFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some Bio.';
                        }
                        if (value.length < 15) {
                          return 'minimum length 15';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).unfocus();
                      },
                      onSaved: (value) {
                        _designerData["bio"] = value;
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    buildButton(
                        width: double.infinity,
                        bgColor: KDrawerBGColor,
                        elevation: true,
                        fontSize: 18,
                        text: "Add Image",
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
