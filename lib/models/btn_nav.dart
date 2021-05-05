import 'package:flutter/material.dart';

class BtnNavModel {
  final String name;
  final Widget icon;
  final Color color;

  BtnNavModel({@required this.name, this.color, @required this.icon});
  static List<BtnNavModel> getitem = [
    BtnNavModel(name: "Home", icon: Icon(Icons.home), color: Colors.orange),
    BtnNavModel(
        name: "Review",
        icon: Icon(
          Icons.message_outlined,
        ),
        color: Colors.orange),
    BtnNavModel(
        name: "Cart",
        icon: Icon(
          Icons.shopping_bag_outlined,
        ),
        color: Colors.orange),
    BtnNavModel(
        name: "Person",
        icon: Icon(
          Icons.person_outlined,
        ),
        color: Colors.orange),
  ];
}
