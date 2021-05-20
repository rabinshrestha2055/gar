import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/widget/confirmationBox.dart';
import 'package:garjoo/widget/confirmationBox1.dart';

class PaymentGateway extends StatefulWidget {
  final cart;
  final sum;
  PaymentGateway({Key key, this.sum, this.cart}) : super(key: key);

  @override
  _PaymentGatewayState createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Text(
            'Choose your payment method',
            style: TextStyle(fontSize: 17),
          ),
          Divider(
            color: Colors.black54,
          ),
        ],
      ),
      content: Container(
        height: 100,
        child: Column(
          children: [
            Text('PAY USING:'),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      return showDialog(
                        context: context,
                        builder: (ctx) => ConfirmationBox(
                          sum: widget.sum,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248, 249, 250),
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 50,
                      child: Image.asset(
                        "asset/ime.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      return showDialog(
                        context: context,
                        builder: (ctx) => ConfirmationBox1(
                          cart: widget.cart,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(5)),
                      height: 50,
                      child: Center(
                          child: Text(
                        'Cash on Delivery',
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
