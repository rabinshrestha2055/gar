import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:garjoo/models/reviewpost.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  SharedPreferences data;

  String email;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      email = data.getString('email');
    });
  }

  String _chosenValue;
  String _category;
  String _subCategory;
  bool _checkbox = false;
  var rating1;
  var rating2;
  var rating3;
  var rating4;
  List category;
  List subCategory;
  final _formkey = GlobalKey<FormState>();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final placeController = TextEditingController();
  final dateController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pnameController = TextEditingController();
  final pbrandController = TextEditingController();
  final durationController = TextEditingController();

  var fname, lname, emaill, pname, phone, pbrand, duration, date, place;

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
        body: Form(
          key: _formkey,
          child:
              // email == null
              //     ? Container(
              //         child: Center(
              //             child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             "You need to login for review",
              //             style: TextStyle(
              //               fontSize: 18,
              //             ),
              //           ),
              //           Container(
              //             margin: EdgeInsets.only(left: 70, right: 70),
              //             child: MaterialButton(
              //                 disabledColor: Colors.red[200],
              //                 shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(20)),
              //                 color: Colors.red[300],
              //                 child: Text(
              //                   'Login',
              //                   style: TextStyle(
              //                       fontSize: 18,
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.bold),
              //                 ),
              //                 onPressed: () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (_) => LoginScreen()));
              //                 }),
              //           ),
              //         ],
              //       )))
              //     :
              ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10, bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Review & Ratings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
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
                              height: 65,
                              width: 340,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                margin: EdgeInsets.only(left: 15, right: 15),
                                elevation: 2.0,
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _category,
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
                                          "Select Category for Review",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      onChanged: (String value) {
                                        setState(() {
                                          _category = value;
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
              SizedBox(height: 10),
              Container(
                height: 56,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0, bottom: 6),
                    child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter First Name';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          fname = value;
                        },
                        controller: fnameController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            labelText: 'First Name')),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 56,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0, bottom: 6),
                    child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Last Name';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          lname = value;
                        },
                        controller: lnameController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            labelText: 'Last Name')),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 56,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0, bottom: 6),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Email';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          emaill = value;
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            labelText: 'Email')),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 56,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0, bottom: 6),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Phone Number';
                          }
                        },
                        onChanged: (value) {
                          phone = value;
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            labelText: 'Phone')),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                              height: 65,
                              width: 340,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                margin: EdgeInsets.only(left: 15, right: 15),
                                elevation: 2.0,
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _subCategory,
                                      style: TextStyle(color: Colors.black),
                                      items: subCategory?.map((item) {
                                            return DropdownMenuItem<String>(
                                              value: item['id'].toString(),
                                              child: Text(
                                                  item['label'].toString()),
                                            );
                                          })?.toList() ??
                                          [],
                                      hint: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Select Sub-Category for Review",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      onChanged: (String value) {
                                        setState(() {
                                          _subCategory = value;
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
              SizedBox(height: 10),
              //accomodation
              _category == '4'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: pnameController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Name of Job';
                                    }
                                  },
                                  onChanged: (value) {
                                    pname = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Name of Accomodation ')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Is the accomodation child/pet friendly?',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              SizedBox(height: 18),
                              DefaultTabController(
                                length: 2,
                                child: TabBar(
                                    unselectedLabelColor: Colors.redAccent,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.redAccent),
                                    tabs: [
                                      Tab(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  color: Colors.redAccent,
                                                  width: 1)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("Yes"),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  color: Colors.redAccent,
                                                  width: 1)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("No"),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 30),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Did you notice anything  unusual in your stay?',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 18),
                                DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                      unselectedLabelColor: Colors.redAccent,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Yes/If yes"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("No"),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Did you meet your expectations?',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 18),
                                DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                      unselectedLabelColor: Colors.redAccent,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Yes"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("No"),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Did you face power outage or water problem?',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 18),
                                DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                      unselectedLabelColor: Colors.redAccent,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Yes/If yes"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("No"),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: pnameController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Any yoga or exercises provided?';
                                    }
                                  },
                                  onChanged: (value) {
                                    pname = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Facilities Provided')),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          // color: blue,
                          height: 230,
                          child: Card(
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 138.0, top: 10),
                                    child: Text('Rating',
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Environment',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 4.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating1) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Affordability',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 4.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating2) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Infranstructure',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 4.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating3) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Facilities',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 4.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating4) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 4.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating4) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                  : SizedBox(width: 1),

//vehicle
              _category == '5'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: pnameController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Auto Name';
                                    }
                                  },
                                  onChanged: (value) {
                                    pname = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Name of auto')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: dateController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Date';
                                    }
                                  },
                                  onChanged: (value) {
                                    date = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Date of service used')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: placeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Place of Service Used';
                                    }
                                  },
                                  onChanged: (value) {
                                    place = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Service Used')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: placeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Any recommendation?';
                                    }
                                  },
                                  onChanged: (value) {
                                    place = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Recommendation')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'How was the performance of vehicle?',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 18),
                                DefaultTabController(
                                  length: 4,
                                  child: TabBar(
                                      unselectedLabelColor: Colors.redAccent,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Good"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Average"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Bad"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Worse"),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Have you taken it to vehicle maintenanace?',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 18),
                                DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                      unselectedLabelColor: Colors.redAccent,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Yes"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("No"),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          // color: blue,
                          height: 230,
                          child: Card(
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 138.0, top: 10),
                                    child: Text('Rating',
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Design',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 8.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating1) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Quality',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 5.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating1) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Delivery',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 5.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating2) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Performance',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 5.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating3) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Price',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 5.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating4) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                  : SizedBox(width: 1),
              SizedBox(height: 10),
              //jobs
              _category == '3'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: pnameController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Name of Job';
                                    }
                                  },
                                  onChanged: (value) {
                                    pname = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Name of Job ')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: dateController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Date';
                                    }
                                  },
                                  onChanged: (value) {
                                    date = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Date of joining')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: placeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Position';
                                    }
                                  },
                                  onChanged: (value) {
                                    place = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Your Position')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: placeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please tell your experience';
                                    }
                                  },
                                  onChanged: (value) {
                                    place = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Your Experience')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: placeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please mention waiting duration';
                                    }
                                  },
                                  onChanged: (value) {
                                    place = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Waiting Duration')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Were you trained for the job?',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(height: 18),
                              DefaultTabController(
                                length: 2,
                                child: TabBar(
                                    unselectedLabelColor: Colors.redAccent,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.redAccent),
                                    tabs: [
                                      Tab(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  color: Colors.redAccent,
                                                  width: 1)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("Yes"),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  color: Colors.redAccent,
                                                  width: 1)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("No"),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 30),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Were you assigned your position related  duties?',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 18),
                                DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                      unselectedLabelColor: Colors.redAccent,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Yes"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("No"),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Did you notice employee politics',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 18),
                                DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                      unselectedLabelColor: Colors.redAccent,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Yes"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("No"),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Were you paid salary on time?',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 18),
                                DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                      unselectedLabelColor: Colors.redAccent,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Yes"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("No"),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          // color: blue,
                          height: 230,
                          child: Card(
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 138.0, top: 10),
                                    child: Text('Rating',
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Payroll',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 4.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating1) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Ecology',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 4.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating2) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Workload',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 4.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating3) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Equality',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 4.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating4) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Empolyee Politics',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 4.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating4) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                  : SizedBox(width: 1),

              //service
              _category == '2'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: pnameController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Service Name';
                                    }
                                  },
                                  onChanged: (value) {
                                    pname = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Service Name')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: dateController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Date';
                                    }
                                  },
                                  onChanged: (value) {
                                    date = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Date of service used')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: placeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Place of Service Used';
                                    }
                                  },
                                  onChanged: (value) {
                                    place = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Service Used')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: placeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Is it a private or government owned?';
                                    }
                                  },
                                  onChanged: (value) {
                                    place = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Ownership')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: placeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please explain if you had  to wait- how long?';
                                    }
                                  },
                                  onChanged: (value) {
                                    place = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Waiting Duration')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Were you satisfied with the performance?',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              SizedBox(height: 18),
                              DefaultTabController(
                                length: 2,
                                child: TabBar(
                                    unselectedLabelColor: Colors.redAccent,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.redAccent),
                                    tabs: [
                                      Tab(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  color: Colors.redAccent,
                                                  width: 1)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("Yes"),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  color: Colors.redAccent,
                                                  width: 1)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("No"),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 30),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Did the service provider ask for any extra payment?',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 18),
                                DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                      unselectedLabelColor: Colors.redAccent,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Yes"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("No"),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'How was the customer service?',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 18),
                                DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                      unselectedLabelColor: Colors.redAccent,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Good"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Bad"),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          // color: blue,
                          height: 230,
                          child: Card(
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 138.0, top: 10),
                                    child: Text('Rating',
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Service',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 5.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating1) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Wait Time',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 4.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating2) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Satisfaction',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 5.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating3) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Price',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 5.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating4) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                  : SizedBox(width: 1),
              SizedBox(height: 10),
              //market

              _category == '1' || _category == null || _category == '6'
                  ? Column(
                      children: [
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: pnameController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Product Name';
                                    }
                                  },
                                  onChanged: (value) {
                                    pname = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Product Name')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: pbrandController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Product Brand';
                                    }
                                  },
                                  onChanged: (value) {
                                    pbrand = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Product Brand')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: dateController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Date';
                                    }
                                  },
                                  onChanged: (value) {
                                    date = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Date of product purchased')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: placeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Place of Purchaseds';
                                    }
                                  },
                                  onChanged: (value) {
                                    place = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Place of Purchaseds')),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 56,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, bottom: 6),
                              child: TextFormField(
                                  controller: durationController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter Duration of use';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    duration = value;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      labelText: 'Duration of use')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Do You Like The Product?',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(height: 18),
                                DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                      unselectedLabelColor: Colors.redAccent,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("Yes"),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.redAccent,
                                                    width: 1)),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text("No"),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          // color: blue,
                          height: 230,
                          child: Card(
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 138.0, top: 10),
                                    child: Text('Rating',
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Design',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 5.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating1) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Price',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 5.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating2) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Quality',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 5.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating3) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              'Delivery',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 5.0, top: 5),
                                              child: RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 2,
                                                ),
                                                onRatingUpdate: (rating4) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                  : SizedBox(width: 1),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _checkbox,
                    onChanged: (bool value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 14.0), child: text()),
                ],
              ),
              SizedBox(height: 10),
              ChangeNotifierProvider<UserDetailsProvider>(
                  create: (context) => UserDetailsProvider(),
                  child: Consumer<UserDetailsProvider>(
                    builder: (context, value, child) => Container(
                        margin: EdgeInsets.only(left: 70, right: 70),
                        child: MaterialButton(
                            disabledColor: Colors.red[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.red[300],
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: _checkbox
                                ? () {
                                    if (_formkey.currentState.validate()) {
                                      setState(() {
                                        String category = _category.toString();
                                        String firstname = fnameController.text
                                            .toString()
                                            .trim();
                                        ;
                                        String lastname = lnameController.text
                                            .toString()
                                            .trim();
                                        ;
                                        //    String email = emailController.text.toString().trim();;
                                        // int phone =
                                        //     int.parse(phoneController.text.toString());
                                        String subcategory =
                                            _subCategory.toString();
                                        String productname = pnameController
                                            .text
                                            .toString()
                                            .trim();
                                        String productbrand = pbrandController
                                            .text
                                            .toString()
                                            .trim();
                                        int date = int.parse(
                                            dateController.text.toString());
                                        String place = placeController.text
                                            .toString()
                                            .trim();

                                        int duration = int.parse(
                                            durationController.text.toString());
                                        int design =
                                            int.parse(rating1.toString());
                                        int price =
                                            int.parse(rating2.toString());
                                        int quality =
                                            int.parse(rating3.toString());
                                        int delivery =
                                            int.parse(rating4.toString());

                                        var reviewPost = ReviewPost(
                                            quality: quality,
                                            design: design,
                                            productname: productname,
                                            productbrand: productbrand,
                                            place: place,
                                            duration: duration,
                                            price: price,
                                            delivery: delivery,
                                            date: date,
                                            category: category,
                                            subCategory: subcategory);

                                        value
                                            .reviewPost(reviewPost)
                                            .then((response) {
                                          if (response.statusCode == 201) {
                                            var snackBar = SnackBar(
                                                content:
                                                    Text('Review Sucessful!'));
                                            Scaffold.of(context)
                                                .showSnackBar(snackBar);
                                          } else {
                                            final snackbar = SnackBar(
                                              content:
                                                  Text('Review Unsucessfull!'),
                                            );
                                            Scaffold.of(context)
                                                .showSnackBar(snackbar);
                                          }
                                        });
                                      });
                                    }
                                  }
                                : null)),
                  )),
              SizedBox(height: 10),
            ],
          ),
        ));
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty('email', email));
  // }
}

Widget text() {
  return Column(
    children: [
      Row(
        children: [
          Text(
            'I have read  and agreed to the ',
            style: TextStyle(fontSize: 12.5),
          ),
          Text(
            'User Agreement ',
            style: TextStyle(fontSize: 12.8, color: red),
          ),
        ],
      ),
      Row(
        children: [
          Text(
            'and',
            style: TextStyle(fontSize: 12.8, color: red),
          ),
          Text(' Privacy Policy. ',
              style: TextStyle(fontSize: 12.8, color: red)),
        ],
      )
    ],
  );
}
