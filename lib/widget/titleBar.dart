import 'package:flutter/material.dart';

Widget titleBar = AppBar(
  automaticallyImplyLeading: false,
  elevation: 2.0,
  backgroundColor: Colors.white,
  title: Padding(
    padding: const EdgeInsets.only(left: 8, top: 12.0),
    child: Image.asset(
      'asset/garjoologo.png',
      height: 150,
      width: 150,
    ),
  ),
);
