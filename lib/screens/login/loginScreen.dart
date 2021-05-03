import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/homePage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email, password;
  final _formKey = GlobalKey<FormState>();
  SharedPreferences data;
  TextEditingController emailController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  bool newuser;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    data = await SharedPreferences.getInstance();
    newuser = (data.getBool('login') ?? true);
    // print(newuser);
    // if (newuser == false) {
    //   Navigator.pushReplacement(
    //       context, new MaterialPageRoute(builder: (context) => HomePage()));
    // }
  }

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 58.0,
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
          SizedBox(height: 20),
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
                      padding: const EdgeInsets.all(2.0),
                      child: TextFormField(
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
                      padding: const EdgeInsets.all(2.0),
                      child: TextFormField(
                          obscureText: true,
                          controller: pwdController,
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
            padding: const EdgeInsets.only(left: 15.0, right: 15),
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
                    builder: (context, value, child) => MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.red[300],
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          String email = emailController.text;
                          String password = pwdController.text;

                          if (_formKey.currentState.validate()) {
                            var loginModel = UserModel(
                              email: email,
                              password: password,
                            );
                            try {
                              value.login(loginModel).then((response) {
                                print("response.body" + response.body);
                                if (response.statusCode == 200) {
                                  data.setString('email', email);
                                  data.setBool('login', false);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => HomePage()));
                                  final snackbar = SnackBar(
                                      content: Text('Login Sucessfull!'));

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                } else if (response.statusCode == 422) {
                                  final snackbar = SnackBar(
                                      content: Text(
                                          "Your account hasn't been activated"));

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                } else {
                                  final snackbar = SnackBar(
                                      content: Text('Login Unsucessfull!'));

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
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
            },
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.only(left: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 12),
                ),
                InkWell(
                  child: Text(
                    'Create a new account.',
                    style: TextStyle(fontSize: 12, color: Colors.red),
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
          ),
          Container(
            height: 50,
            child: TextButton(
              child: const Text('Logout'),
              onPressed: () {
                data.clear();

                ///ignore: deprecated_member_use
                data.commit();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                    (Route<dynamic> route) => false);
              },
            ),
          )
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget cancelButton = MaterialButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  Widget confirmButton = MaterialButton(
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
