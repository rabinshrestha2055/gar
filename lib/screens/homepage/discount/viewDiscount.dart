import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/homepage/discount/viewDiscountList.dart';
import 'package:garjoo/widget/customAppBar.dart';

class ViewDiscount extends StatefulWidget {
  var cart;
  double sum;
  var email;
  var userName;
  ViewDiscount({Key key, this.cart, this.sum, this.email, this.userName})
      : super(key: key);

  @override
  _ViewDiscountState createState() => _ViewDiscountState();
}

class _ViewDiscountState extends State<ViewDiscount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, email: widget.email, userName: widget.userName),
      body: ViewDiscountList(),
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
