import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';

class CheckoutScreen extends StatefulWidget {
  var cart;
  var sum;
  var email;
  var userName;

  CheckoutScreen({
    Key key,
    this.cart,
    this.userName,
    this.email,
    this.sum,
  }) : super(key: key);

  @override
  CheckoutScreenState createState() => CheckoutScreenState();
}

class CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      AppURl.path + widget.cart[index].image,
                      height: 100,
                    ),
                    subtitle: Text("Rs" + widget.cart[index].price.toString()),
                    title: Text(widget.cart[index].title),
                    trailing: InkWell(child: Icon(Icons.remove_circle)),
                    onTap: () {
                      setState(() {
                        widget.sum = widget.sum - widget.cart[index].price;
                        widget.cart.remove(widget.cart[index]);
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: widget.cart.length),
            Divider(),
            Card(
              elevation: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TOTAL',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      Text(
                        '\$${widget.sum}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.cart.length.toString() + " Items",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Checkout(
                                    sum: widget.sum,
                                    email: widget.userName,
                                    userName: widget.userName,
                                  )));
                    },
                    child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Proceed to checkout',
                              style: TextStyle(color: white, fontSize: 12),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
