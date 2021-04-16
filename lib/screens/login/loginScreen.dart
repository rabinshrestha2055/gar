import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email, password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 38.0,
            ),
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
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
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
                child: ChangeNotifierProvider<UserDetailsProvider>(
                  create: (context) => UserDetailsProvider(),
                  child: Consumer<UserDetailsProvider>(
                    // ignore: deprecated_member_use
                    builder: (context, value, child) => RaisedButton(
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
                            var loginModel = UserModel(
                              email: email,
                              password: password,
                            );
                            try {
                              value.login(loginModel).then((response) {
                                if (response.statusCode == 200) {
                                  final snackbar = SnackBar(
                                      content: Text('Login Sucessfull!'));
                                  // ignore: deprecated_member_use
                                  Scaffold.of(context).showSnackBar(snackbar);
                                } else {
                                  final snackbar = SnackBar(
                                      content: Text('Login Unsucessfull!'));
                                  // ignore: deprecated_member_use
                                  Scaffold.of(context).showSnackBar(snackbar);
                                }
                              }).catchError((error) => print(error));
                            } catch (e) {
                              print(e.toString());
                            }
                          }
                        }),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            child: Center(
                child: Text(
              'Forgot password?',
            )),
            onTap: () {
              showAlertDialog(context);
              // Navigator.push(context, MaterialPageRoute(builder: (_)=>DailogBox()));
            },
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Don't have an account? ",style: TextStyle(fontSize: 12),),
              InkWell(
                child: Text(
                  'Create a new account.',
                  style: TextStyle(fontSize:12,color: Colors.red),
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
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // ignore: deprecated_member_use
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // ignore: deprecated_member_use
  Widget confirmButton = FlatButton(
    child: Text("Confirm"),
    onPressed: () {},
  );

  AlertDialog alert = AlertDialog(
    title: Text("Reset Password"),

    content: Container(
      height: 120,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'New Password'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Confirm Password'),
          ),
        ],
      ),
    ),
    actions: [
      cancelButton,
      confirmButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
