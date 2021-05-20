import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garjoo/colors.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class MarketFilter extends StatefulWidget {
  @override
  _MarketFilterState createState() => _MarketFilterState();
}

class _MarketFilterState extends State<MarketFilter> {
  List category;
  String _chosenValue;
  String _chosenValue1;
  Future myParent;
  UserDetailsProvider user = UserDetailsProvider();
  @override
  void initState() {
    myParent = user.getParent();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 280.0,
        height: MediaQuery.of(context).size.height * 0.47,
        // height: 280.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 230,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Refine',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 19.0,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    TextButton(onPressed: () {}, child: Text('Clear All'))
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text('Select Category', style: TextStyle(color: black)),
              SizedBox(height: 5),
              ChangeNotifierProvider(
                create: (context) => UserDetailsProvider(),
                child: Consumer<UserDetailsProvider>(
                  builder: (context, value1, child) {
                    return FutureBuilder(
                        future: myParent,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Container();
                          } else if (snapshot.hasData) {
                            var response = snapshot.data;
                            var jsonData = json.decode(response);
                            category = jsonData[0]['childs'];
                            return FutureBuilder(
                              future:
                                  user.getFilterResult(category: _chosenValue),
                              builder: (context, snapshot) => Container(
                                height: 45,
                                width: 340,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  margin: EdgeInsets.only(left: 0, right: 15),
                                  elevation: 2.0,
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: _chosenValue,
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
                                            "Select Category",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        onChanged: (String value) {
                                          setState(() {
                                            _chosenValue = value;
                                          });
                                        },
                                      ),
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
              SizedBox(height: 8),
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    Text('Price:', style: TextStyle(color: black)),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                child: Expanded(
                  flex: 0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Min:', style: TextStyle(color: black)),
                          SizedBox(width: 10),
                          Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                  border: Border.all(color: orange),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ))),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('Max:', style: TextStyle(color: black)),
                          SizedBox(width: 10),
                          Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                  border: Border.all(color: orange),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none)))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Location', style: TextStyle(color: black)),
              Container(
                width: 250,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 2.0,
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _chosenValue1,
                        style: TextStyle(color: Colors.black),
                        items: <String>[
                          'Kathmandu',
                          'Janakpur',
                          'Saptari',
                          'Rupandehi',
                          'Makawanpur',
                          'Accham',
                          'Bhaktapur',
                          'Lalitpur'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Select Location",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _chosenValue1 = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
