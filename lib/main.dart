import 'package:flutter/material.dart';
import 'package:garjoo/core/store.dart';
import 'package:garjoo/startPage.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(VxState(store: MyStore(), child: Garjoo()));

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
