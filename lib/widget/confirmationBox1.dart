import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/core/store.dart';
import 'package:garjoo/models/cart_model.dart';
import 'package:garjoo/models/cod.dart';
import 'package:garjoo/screens/homePage.dart';
import 'package:garjoo/startPage.dart';

import 'package:velocity_x/velocity_x.dart';

class ConfirmationBox1 extends StatefulWidget {
  final email;
  final userName;
  final fullName;
  final address;
  final phone;
  ConfirmationBox1({
    this.userName,
    this.address,
    this.phone,
    this.fullName,
    this.email,
    Key key,
  }) : super(key: key);

  @override
  _ConfirmationBox1State createState() => _ConfirmationBox1State();
}

class _ConfirmationBox1State extends State<ConfirmationBox1> {
  final CartModel _cart = (VxState.store as MyStore).cart;
  UserDetailsProvider user = UserDetailsProvider();
  List demo = [];
  @override
  Widget build(BuildContext context) {
    print(_cart.items.toList());
    return AlertDialog(
      title: Image.asset(
        'asset/alert.png',
        height: 100,
      ),
      content: Container(
        height: 120,
        child: Column(
          children: [
            Text(
              'Order Confirmation:',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
            Text(
              'Are you sure ?',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      var cod = CashOnDelivery(
                          userId: 76,
                          receiverName: widget.fullName,
                          receiverNumber: widget.phone,
                          receiverEmail: widget.email,
                          shippingAddress: widget.address,
                          shippingCharge: 0,
                          subTotal: _cart.totalPrice,
                          grandTotal: _cart.totalPrice,
                          products: _cart.items.sublist(1));
                      user.cashOnDelivery(cashOnDelivery: cod).then((response) {
                        if (response.statusCode == 201) {
                          final snackbar = SnackBar(content: Text("Success"));
                          RemoveMutation(_cart.items.first);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => HomePage(
                                      email: widget.email,
                                      userName: widget.userName)));

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        } else {
                          final snackbar = SnackBar(content: Text("Failed!"));

                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 63, 115, 218),
                          borderRadius: BorderRadius.circular(5)),
                      height: 50,
                      child: Center(
                          child: Text(
                        'Yes,I am sure!',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 170, 170, 170),
                          borderRadius: BorderRadius.circular(5)),
                      height: 50,
                      child: Center(
                          child: Text(
                        'No,cancel it!',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
