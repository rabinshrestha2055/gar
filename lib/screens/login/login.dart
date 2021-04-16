import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<BtnNavModel> btnNav = BtnNavModel.getitem;
  bool _validate = false;
  var email;
  var password;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Review',
      style: optionStyle,
    ),
    Text(
      'Index 2: Cart',
      style: optionStyle,
    ),
    Text(
      'Index 3: Person',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 8, top: 12.0),
          child: Image.asset(
            'asset/garjoologo.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 38.0, bottom: 30),
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  shadows: <Shadow>[
                    Shadow(blurRadius: 1.0, offset: Offset(0.2, 0.2))
                  ]),
            ),
          ),
          // SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 3,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(

                      padding: const EdgeInsets.all(8.0),

                 
                      child: TextFormField(

                          // keyboardType: TextInputType.text,
                          controller: emailController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter valid name';
                            }
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Email')),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter valid password';
                            }
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          //  keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              prefixIcon: Icon(Icons.lock),
                              labelText: 'Password')),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                height: 50,
                width: 320,
                // ignore: deprecated_member_use
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.red[300],
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        login(email: email, password: password);
                      }
                    }),
              ),
            ),
          ),
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Row(
              children: [
                Text("Don't have an account? "),
                InkWell(
                  child: Text(
                    'Create a new account.',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        items: btnNav
            .map((e) => BottomNavigationBarItem(
                  icon: e.icon,
                  label: e.name,
                ))
            .toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ),
    );
  }

  login({String email, password}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': password,
    };
    var jsonResponse = null;
    var response =
        await http.post("https://api.garjoo.com/api/login", body: data);
    jsonResponse = json.decode(response.body);
    // print(jsonResponse);
    var jsonData = jsonResponse['data'];
    print(jsonData);
    print('Response status: ${response.statusCode}');
    // print('Response body:${response.body}');

    if (jsonResponse != null) {
      sharedPreferences.setString("Name", jsonData["name"]);
      sharedPreferences.setString("Email", jsonData["email"]);
      sharedPreferences.setString("Token", jsonResponse["token"]);
      sharedPreferences.setString("Type", jsonData["type"]);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Home()));
    } else {
      //  print(response.body);
    }
  }
}
