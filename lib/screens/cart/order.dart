import 'package:flutter/material.dart';

import '../../core.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
        margin: EdgeInsets.only(top: 75, left: 45, right: 45),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[100],
              child: Icon(
                Icons.check,
                color: red,
                size: 50,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text('Order Placed!', style: TextStyle(fontSize: 28)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Your order was placed sucessfully.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    ' For more details, check All My Orders',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '  page under Profile tab',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 45),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Order()));
              },
              child: Container(
                  height: 43,
                  width: 150,
                  decoration: BoxDecoration(
                      color: red, borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'MY ORDERS',
                        style: TextStyle(color: white, fontSize: 16),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
