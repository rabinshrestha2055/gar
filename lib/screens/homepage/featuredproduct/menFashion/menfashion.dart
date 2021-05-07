import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/homepage/featuredproduct/menFashion/menFashionList.dart';
import 'package:garjoo/widget/customAppBAr.dart';

class MenFashion extends StatefulWidget {
  final cart;
  int sum;
  final email;
  final username;
  MenFashion({Key key, this.cart, this.sum, this.email, this.username})
      : super(key: key);

  @override
  _MenFashionState createState() => _MenFashionState();
}

class _MenFashionState extends State<MenFashion> {
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          cart: widget.cart,
          sum: widget.sum,
          email: widget.email,
          userName: widget.username),
      body: MenFashionList(
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
