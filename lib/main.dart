import 'package:flutter/material.dart';
import 'package:garjoo/startPage.dart';

void main() => runApp(Garjoo());

class Garjoo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue[400],
            accentColor: Colors.redAccent,
            primarySwatch: Colors.grey,
            textTheme: TextTheme(
              subtitle1: TextStyle(color: Colors.red),
              subtitle2: TextStyle(color: Colors.orange),
            )),
        debugShowCheckedModeBanner: false,
        home: StartPage());
  }
}
