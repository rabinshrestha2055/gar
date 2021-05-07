import 'package:flutter/material.dart';
import 'package:garjoo/screens/homepage/newArrival/arrivalViewList.dart';
import 'package:garjoo/widget/customAppBAr.dart';

import '../../../core.dart';

class ViewArrival extends StatefulWidget {
  final ValueSetter<dynamic> valueSetter;
  var cart;
  int sum;
  var email;
  var userName;
  ViewArrival(
      {Key key,
      this.valueSetter,
      this.cart,
      this.sum,
      this.email,
      this.userName})
      : super(key: key);

  @override
  _ViewArrivalState createState() => _ViewArrivalState();
}

class _ViewArrivalState extends State<ViewArrival> {
  bool loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          cart: widget.cart,
          sum: widget.sum,
          email: widget.email,
          userName: widget.userName),
      body: ArrivalViewList(
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
