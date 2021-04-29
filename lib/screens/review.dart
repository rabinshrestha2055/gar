import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../core.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  String _chosenValue;
  bool _checkbox = false;
  double rating;
  final _formkey = GlobalKey<FormState>();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final placeController = TextEditingController();
  final dateController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pnameController = TextEditingController();

  var fname, lname, email, pname;

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
          child: ListView(
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
              Center(
                child: Container(
                  height: 65,
                  width: 340,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2.0,
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: _chosenValue,
                          style: TextStyle(color: Colors.black),
                          items: <String>[
                            'Market',
                            'Jobs',
                            'Service',
                            'Real Estate',
                            'Motor',
                            'Accomodation',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
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
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ),
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
                          pname = value;
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
                          pname = value;
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
              Center(
                child: Container(
                  height: 65,
                  width: 340,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2.0,
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: _chosenValue,
                          style: TextStyle(color: Colors.black),
                          items: <String>[
                            'Market',
                            'Jobs',
                            'Service',
                            'Real Estate',
                            'Motor',
                            'Accomodation',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
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
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ),
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
              Center(
                child: Container(
                  width: 340,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2.0,
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: _chosenValue,
                          style: TextStyle(color: Colors.black),
                          items: <String>[
                            'Market',
                            'Jobs',
                            'Service',
                            'Real Estate',
                            'Motor',
                            'Accomodation',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Select Sub-  Category for Review",
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
                          pname = value;
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
                          pname = value;
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 138.0, top: 10),
                            child:
                                Text('Rating', style: TextStyle(fontSize: 20)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
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
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 18,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.red,
                                          size: 2,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
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
                                          left: 5, bottom: 8.0, top: 5),
                                      child: RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 18,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.red,
                                          size: 2,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
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
                                          left: 5, bottom: 8.0, top: 5),
                                      child: RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 18,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.red,
                                          size: 2,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Service',
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
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 18,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.red,
                                          size: 2,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
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
              ),
              Expanded(
                child: Row(
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
                        padding: const EdgeInsets.only(top: 14.0),
                        child: text()),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
                            // if (_checkbox) {
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (_) => Profile()));
                            // } else {
                            //   print('click the checkbox');
                            // }
                          }
                        : null),
              ),
              SizedBox(height: 10),
            ],
          ),
        ));
  }
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
