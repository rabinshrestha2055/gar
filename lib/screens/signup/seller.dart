import 'package:garjoo/core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garjoo/widget/policy.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Seller extends StatefulWidget {
  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  bool _isChecked = false;
  bool _isChecked1 = false;
  final _formkey = GlobalKey<FormState>();
  var email, confirmpassword, cname, cemail, cphone, fname, lname, ctycode;
  var fileName;
  var password;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.custom;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            Form(
              key:_formkey,
                          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 6, bottom: 6),
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter first name';
                            }
                          },
                          onChanged: (value) {
                            fname = value;
                          },
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              labelText: 'First Name')),
                    ),
                  ),
                
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 6, bottom: 6),
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter last name';
                            }
                          },
                          onChanged: (value) {
                            lname = value;
                          },
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              labelText: 'Last Name')),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 6, bottom: 6),
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter company name';
                            }
                          },
                          onChanged: (value) {
                            cname = value;
                          },
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              labelText: 'Company Name')),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 6, bottom: 6),
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter comapany email';
                            }
                          },
                          onChanged: (value) {
                            cemail = value;
                          },
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              labelText: 'Company Email')),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            child: Padding(
                                padding: const EdgeInsets.only(top: 5, left: 8),
                                child: Container(
                                  padding:
                                      const EdgeInsets.only(left: 8, bottom: 0.0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.60,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: ListView.builder(
                                      itemCount:
                                          _paths != null && _paths.isNotEmpty
                                              ? _paths.length
                                              : 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final bool isMultiPath =
                                            _paths != null && _paths.isNotEmpty;
                                        fileName = (isMultiPath
                                            ? _paths
                                                .map((e) => e.path)
                                                .toList()[index]
                                            : _fileName ?? '...');

                                        return Text(
                                          fileName.toString().split('/').last,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 15.5),
                                        );
                                      },
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              border: Border.all(color: Colors.black26)),
                          child: InkWell(
                              onTap: () {
                                _openFileExplorer();
                              },
                              child: Center(
                                  child: Text(
                                'Browse',
                                style: TextStyle(color: Colors.white),
                              ))),
                        )
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: IntlPhoneField(
                        controller: _controller,
                        onChanged: (value) {
                          cphone = value.number;
                          ctycode = value.countryCode;
                        },
                        initialCountryCode: 'NP',
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: 'Phone number',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 6, bottom: 6),
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter valid email';
                            }
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              labelText: 'Email')),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 6, bottom: 6),
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter valid password';
                            }
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              labelText: 'Password')),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 6, bottom: 6),
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter valid password';
                            }
                          },
                          onChanged: (value) {
                            confirmpassword = value;
                          },
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              labelText: 'Confirm Password')),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)),
                        height: 50,
                        width: 320,
                        child: ChangeNotifierProvider<UserDetailsProvider>(
                            create: (context) => UserDetailsProvider(),
                            child: Consumer<UserDetailsProvider>(
                                builder: (context, value, child) =>
                                    MaterialButton(
                                        disabledColor: Colors.red[200],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        color: Colors.red[300],
                                        child: Text(
                                          'Register',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: _isChecked && _isChecked1
                                            ? () {
                                              if(_formkey.currentState.validate()){
                                                var userModel = UserModel(
                                                  username: fname + lname,
                                                  email: email,
                                                  type: 'seller',
                                                  password: password,
                                                  confirmPassword:
                                                      confirmpassword,
                                                  companyName: cname,
                                                  companyEmail: cemail,
                                                  phoneNumber: ctycode + cphone,
                                                );
                                                value
                                                    .sellerRegister(
                                                        filename: fileName,
                                                        registerModel: userModel)
                                                    .then((response) {
                                                  if (response.statusCode ==
                                                      200) {
                                                    var snackBar = SnackBar(
                                                        content: Text(
                                                            'Register Sucessful!'));
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(snackBar);
                                                  } else if (response
                                                          .statusCode ==
                                                      422) {
                                                    var snackBar = SnackBar(
                                                        content: Text(
                                                            'The email has been already taken'));
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(snackBar);
                                                  } else {
                                                    final snackbar = SnackBar(
                                                      content: Text(
                                                          'Register Unsucessfull!'),
                                                    );
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(snackbar);
                                                  }
                                                });
                                              }
                                              }
                                            : null))),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                          value: _isChecked,
                          onChanged: (bool value) {
                            setState(() {
                              _isChecked = value;
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 9),
                        child: firstText(),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: _isChecked1,
                          onChanged: (bool value) {
                            setState(() {
                              _isChecked1 = value;
                            });
                          }),
                      secondText()
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",
                    style: TextStyle(fontSize: 14)),
                InkWell(
                  child: Text(
                    'Login Now',
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Image.asset('asset/facebook.jpeg'), onPressed: () {}),
                IconButton(
                    icon: Image.asset('asset/google.png'), onPressed: () {}),
              ],
            ),
            SizedBox(height: 17),
          ],
        ),
      ),
    );
  }

  Widget firstText() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'I have read and agreed to the ',
              style: TextStyle(fontSize: 12.5, color: Colors.black),
            ),
            InkWell(
              onTap: () => Utils.openLink(
                  url: 'https://garjoonepal.com/privacy-policy?redirect=2'),
              child: Text(
                'User Agreement ',
                style: TextStyle(fontSize: 12.5, color: Colors.red),
              ),
            ),
          ],
        ),
        Center(
            child: Row(
          children: [
            Text(
              'and',
              style: TextStyle(fontSize: 12.5, color: Colors.black),
            ),
            InkWell(
              onTap: () => Utils.openLink(
                  url: 'https://garjoonepal.com/privacy-policy?redirect=2'),
              child: Text(
                ' Privacy Policy.',
                style: TextStyle(fontSize: 12.5, color: Colors.red),
              ),
            ),
          ],
        ))
      ],
    );
  }

  Widget secondText() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'I accept the ',
              style: TextStyle(fontSize: 12.5, color: Colors.black),
            ),
            InkWell(
              onTap: () => Utils.openLink(
                  url: 'https://garjoonepal.com/privacy-policy?redirect=2'),
              child: Text(
                'Terms and Conditions ',
                style: TextStyle(fontSize: 12.5, color: Colors.red),
              ),
            ),
            Text(
              'and all informa-',
              style: TextStyle(fontSize: 12.5, color: Colors.black),
            ),
          ],
        ),
        Text(
          'tion provided by me is valid. If any misinformation',
          style: TextStyle(fontSize: 12.5, color: Colors.black),
        ),
        Text(
          "is provided then, I will be  liable .",
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

_launchURL1() async {
  const url = 'https://garjoonepal.com/privacy-policy?redirect=2';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
