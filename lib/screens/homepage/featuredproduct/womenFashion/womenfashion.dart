import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/homepage/featuredproduct/womenFashion/womenFashishList.dart';
import 'package:garjoo/widget/customAppBar.dart';

class WomenFashion extends StatefulWidget {
  var cart;
  double sum;
  var email;
  var userName;
  WomenFashion({Key key, this.cart, this.sum, this.email, this.userName})
      : super(key: key);

  @override
  _WomenFashionState createState() => _WomenFashionState();
}

class _WomenFashionState extends State<WomenFashion> {
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          email: widget.email, userName: widget.userName, context: context),
      body: WomenFashionList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          return showDialog(
            context: context,
            builder: (ctx) => Filter(),
          );
        },
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
