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
  int rating1;
  int rating2;
  int rating3;
  int rating4;
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
              // Container(
              //   width: 340,
              //   child: Card(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12)),
              //     margin: EdgeInsets.only(left: 15, right: 15),
              //     elevation: 2.0,
              //     child: DropdownButtonHideUnderline(
              //       child: ButtonTheme(
              //         alignedDropdown: true,
              //         child: DropdownButton<String>(
              //           isExpanded: true,
              //           value: _chosenValue,
              //           style: TextStyle(color: Colors.black),
              //           items: <String>[
              //             'Market',
              //             'Jobs',
              //             'Service',
              //             'Real Estate',
              //             'Motor',
              //             'Accomodation',
              //           ].map<DropdownMenuItem<String>>((String value) {
              //             return DropdownMenuItem<String>(
              //               value: value,
              //               child: Text(value),
              //             );
              //           }).toList(),
              //           hint: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text(
              //               "Select Sub-  Category for Review",
              //               style: TextStyle(
              //                 fontSize: 16,
              //               ),
              //             ),
              //           ),
              //           onChanged: (String value) {
              //             setState(() {
              //               _chosenValue = value;
              //             });
              //           },
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.redAccent, width: 1)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Yes"),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.redAccent, width: 1)),
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
                          padding: const EdgeInsets.only(left: 138.0, top: 10),
                          child: Text('Rating', style: TextStyle(fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Design',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
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
                                          if (response.statusCode == 200) {
                                            var snackBar = SnackBar(
                                                content:
                                                    Text('Review Sucessful!'));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          } else {
                                            final snackbar = SnackBar(
                                              content:
                                                  Text('Review Unsucessfull!'),
                                            );
                                            ScaffoldMessenger.of(context)
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
