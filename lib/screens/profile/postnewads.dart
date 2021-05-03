import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../core.dart';

class PostNewAds extends StatefulWidget {
  @override
  _PostNewAdsState createState() => _PostNewAdsState();
}

class _PostNewAdsState extends State<PostNewAds> {
  bool _isChecked = false;
  bool _loadingPath = false;
  List<PlatformFile> _paths;
  String _fileName;
  String _extension;
  bool _multiPick = false;
  String _directoryPath;
  FileType _pickingType = FileType.custom;
  TextEditingController _controller = TextEditingController();

  String _choosenValue1;
  String _choosenValue2;
  String _choosenValue3;
  String _choosenValue4;

  List category;
  List subCategory;

  final _formkey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final pAddressController = TextEditingController();
  final sAddressController = TextEditingController();
  final mobileController = TextEditingController();
  final queController = TextEditingController();
  final tagController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  String _chosenValue;
  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '')?.split('/')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: white,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Image.asset(
            'asset/garjoologo.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 8),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            sizedBox(),
            Container(
              padding: EdgeInsets.only(left: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Add Classified Ad',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(
                      'Fill the required  fields. Note: *are  required fields.'),
                ],
              ),
            ),
            sizedBox(),
            ChangeNotifierProvider(
              create: (context) => UserDetailsProvider(),
              child: Consumer<UserDetailsProvider>(
                builder: (context, value1, child) {
                  return FutureBuilder(
                      future: value1.getParent(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Container();
                        } else if (snapshot.hasData) {
                          var response = snapshot.data;
                          var jsonData = json.decode(response);
                          category = jsonData;
                          return Container(
                            height: 55,
                            width: 340,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              margin: EdgeInsets.only(left: 8, right: 15),
                              elevation: 2.0,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: _choosenValue1,
                                    style: TextStyle(color: Colors.black),
                                    items: category?.map((item) {
                                          return DropdownMenuItem<String>(
                                            value: item['id'].toString(),
                                            child: Text(item['label']),
                                          );
                                        })?.toList() ??
                                        [],
                                    hint: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Select Category*",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    onChanged: (String value) {
                                      setState(() {
                                        _choosenValue1 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      });
                },
              ),
            ),
            sizedBox(),
            ChangeNotifierProvider(
              create: (context) => UserDetailsProvider(),
              child: Consumer<UserDetailsProvider>(
                builder: (context, value, child) {
                  return FutureBuilder(
                      future: value.getParent(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Container();
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          var response = snapshot.data;
                          var jsonData = json.decode(response);
                          subCategory = jsonData[0]['childs'];
                          return Container(
                            height: 55,
                            width: 340,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              margin: EdgeInsets.only(left: 8, right: 15),
                              elevation: 2.0,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: _choosenValue4,
                                    style: TextStyle(color: Colors.black),
                                    items: subCategory?.map((item) {
                                          return DropdownMenuItem<String>(
                                            value: item['id'].toString(),
                                            child:
                                                Text(item['label'].toString()),
                                          );
                                        })?.toList() ??
                                        [],
                                    hint: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Select Sub-Category*",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    onChanged: (String value) {
                                      setState(() {
                                        _choosenValue4 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      });
                },
              ),
            ),
            sizedBox(),
            Container(
              height: 56,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.only(left: 8, right: 15),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 6),
                  child: TextFormField(
                      controller: titleController,
                      style: TextStyle(color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter Title*')),
                ),
              ),
            ),
            sizedBox(),
            Container(
              height: 56,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.only(left: 8, right: 15),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 6),
                  child: TextFormField(
                      controller: priceController,
                      style: TextStyle(color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter Price*')),
                ),
              ),
            ),
            sizedBox(),
            Container(
                height: 100,
                margin: EdgeInsets.only(left: 8, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    controller: descriptionController,
                    style: TextStyle(color: black),
                    maxLines: 2,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Description*'),
                  ),
                )),
            sizedBox(),
            Container(
              padding: EdgeInsets.only(right: 10),
              height: 65,
              width: 360,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 2.0,
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _choosenValue2,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Kathmandu',
                        'Lalitpur',
                        'Bhaktapur',
                        'Gorkha',
                        'Chitwan',
                        'Agrakhachi',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Please Select District",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _choosenValue2 = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            sizedBox(),
            Container(
              height: 56,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.only(left: 8, right: 15),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 6),
                  child: TextFormField(
                      controller: pAddressController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter Primary Address*')),
                ),
              ),
            ),
            sizedBox(),
            Container(
              height: 56,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.only(left: 8, right: 15),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 6),
                  child: TextFormField(
                      controller: sAddressController,
                      style: TextStyle(color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter Secondary Address*')),
                ),
              ),
            ),
            sizedBox(),
            Container(
              padding: EdgeInsets.only(right: 10),
              height: 65,
              width: 360,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 2.0,
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _choosenValue3,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'art',
                        'house',
                        'land',
                        'real-estate',
                        'fashion',
                        'rent',
                        'sale'
                      ].map<DropdownMenuItem<String>>((String value2) {
                        return DropdownMenuItem<String>(
                          value: value2,
                          child: Text(value2),
                        );
                      }).toList(),
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Choose Tag",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      onChanged: (String value2) {
                        setState(() {
                          _choosenValue3 = value2;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 56,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.only(left: 8, right: 15),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 6),
                  child: TextFormField(
                      controller: tagController,
                      style: TextStyle(color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Enter new tags seperated by space')),
                ),
              ),
            ),
            sizedBox(),
            Container(
              height: 56,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.only(left: 8, right: 15),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 6),
                  child: TextFormField(
                      controller: queController,
                      style: TextStyle(color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText:
                              "Enter question seperated by question mark '?'")),
                ),
              ),
            ),
            sizedBox(),
            InkWell(
              onTap: () {
                _openFileExplorer();
              },
              child: Container(
                height: 180,
                margin: EdgeInsets.only(left: 8, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Image Upload',
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                    ),
                    Center(
                        child: Image.asset(
                      'asset/upload.png',
                      height: 120,
                    )),
                  ],
                ),
              ),
            ),
            sizedBox(),
            Container(
              height: 56,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.only(left: 8, right: 15),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 6),
                  child: TextFormField(
                      controller: mobileController,
                      style: TextStyle(color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: "Enter mobile")),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: _isChecked,
                    onChanged: (bool value) {
                      setState(() {
                        _isChecked = value;
                      });
                    }),
                secondText()
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              padding: EdgeInsets.all(8),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        disabledColor: Colors.red[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.red[300],
                        child: Text(
                          'Save as Draft',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: _isChecked ? () {} : null),
                    MaterialButton(
                        disabledColor: Colors.red[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.red[300],
                        child: Text(
                          'Post Ad',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: _isChecked ? () {} : null),
                    MaterialButton(
                        disabledColor: Colors.red[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.red[300],
                        child: Text(
                          'Preview',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

sizedBox() {
  return SizedBox(
    height: 5,
  );
}

Widget secondText() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'I have read and agree to the  ',
            style: TextStyle(fontSize: 12.5, color: Colors.black),
          ),
          Text(
            'Posting policy, terms,',
            style: TextStyle(fontSize: 12.5, color: Colors.red),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'and limitaion',
            style: TextStyle(fontSize: 12.5, color: Colors.red),
          ),
          Text(
            ' and ',
            style: TextStyle(fontSize: 12.5, color: Colors.black),
          ),
          Text(
            'Restricted items poilcy',
            style: TextStyle(fontSize: 12.5, color: Colors.red),
          ),
        ],
      ),
    ],
  );
}
