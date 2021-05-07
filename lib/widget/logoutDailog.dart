import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/main.dart';

class LogoutDailog extends StatefulWidget {
  @override
  _LogoutDailogState createState() => _LogoutDailogState();
}

class _LogoutDailogState extends State<LogoutDailog> {
  UserDetailsProvider user = UserDetailsProvider();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Are you sure to Logout?'),
        content: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.red[300],
          child: Text(
            'Logout',
            style: TextStyle(color: white),
          ),
          onPressed: () {
            setState(() {
              user.logoutUser();
            });
            final snackbar = SnackBar(content: Text('Logout Sucessfull!'));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) => Garjoo()));
          },
        ));
  }
}
