import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/homepage/discount/viewDiscountList.dart';
import 'package:garjoo/widget/customAppBAr.dart';

class ViewDiscount extends StatefulWidget {
  var cart;
  int sum;
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
          cart: widget.cart,
          sum: widget.sum,
          context: context,
          email: widget.email,
          userName: widget.userName),
      body: ViewDiscountList(
        valueSetter: (selectedProduct) {
          setState(() {
            widget.cart.add(selectedProduct);
            widget.cart.forEach((element) {
              widget.sum = widget.sum + element.price;
            });
          });
        },
      ),
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
