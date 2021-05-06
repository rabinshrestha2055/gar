import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/cart/checkoutListView.dart';

class Checkout extends StatefulWidget {
  final sum;
  final email;
  final userName;

  const Checkout({Key key, this.sum, this.email, this.userName})
      : super(key: key);
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  UserDetailsProvider user = UserDetailsProvider();

  var email, confirmpassword, cname, cemail, cphone, fname, lname, ctycode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: white,
          title: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              'asset/garjoologo.png',
              height: 150,
              width: 150,
            ),
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: CheckOutListView(
              email: widget.email,
              sum: widget.sum,
              userName: widget.userName,
            )));
  }
}
