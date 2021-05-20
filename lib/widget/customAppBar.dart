import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/core/store.dart';
import 'package:garjoo/models/cart_model.dart';

import 'package:garjoo/screens/homepage/visitStoreTop.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customAppBar({BuildContext context, var email, var userName}) {
  final CartModel _cart = (VxState.store as MyStore).cart;
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0.0,
    backgroundColor: Colors.white,
    title: Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Image.asset(
        'asset/garjoologo.png',
        height: 150,
        width: 150,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: IconButton(
            icon: Icon(
              Icons.store,
              color: orange,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Store()));
            }),
      ),
      Stack(children: [
        Positioned(
            top: 5,
            left: 5,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.red,
              child: VxBuilder(
                mutations: {AddMutation, RemoveMutation},
                builder: (context, _) => Text(
                  _cart.items.length.toString(),
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            )),
        IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: orange,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Cart()));
            }),
      ]),
    ],
  );
}
