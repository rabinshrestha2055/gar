import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/homepage/featuredproduct/womenFashion/womenFashishList.dart';
import 'package:garjoo/widget/customAppBAr.dart';

class WomenFashion extends StatefulWidget {
  var cart;
  int sum;
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
          cart: widget.cart,
          sum: widget.sum,
          email: widget.email,
          userName: widget.userName,
          context: context),
      body: WomenFashionList(
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
