import 'package:flutter/material.dart';

class DailogBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: AlertDialog(
        title: Text('Reset Password'),
        actions: [
          // TextFormField(
          //   decoration: InputDecoration(labelText: 'helloo'),
          // )
        ],
        
      ),
    );
  }
}