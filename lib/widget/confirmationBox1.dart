import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/models/cod.dart';

class ConfirmationBox1 extends StatefulWidget {
  final cart;
  ConfirmationBox1({Key key, this.cart}) : super(key: key);

  @override
  _ConfirmationBox1State createState() => _ConfirmationBox1State();
}

class _ConfirmationBox1State extends State<ConfirmationBox1> {
  UserDetailsProvider user = UserDetailsProvider();
  @override
  Widget build(BuildContext context) {
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
                          receiverName: "Ashish Dahal",
                          receiverNumber: "980-7150500",
                          receiverEmail: "suvalaxmi@yopmail.com",
                          shippingAddress: "Simara,Bara",
                          shippingCharge: 0,
                          subTotal: 5500,
                          grandTotal: 5500,
                          products: [
                            {
                              "id": 202,
                              "name": "BANJO",
                              "price": 5500,
                              "slug": "banjo-202",
                              "thumbnail":
                                  "/image/pthumbnail/0a7a6c9985cf71ca26e88cab8d2f6c48.jpeg",
                              "vendor_id": 169
                            }
                          ]);
                      user.cashOnDelivery(cashOnDelivery: cod).then((response) {
                        print(response.body);
                        if (response.statusCode == 201) {
                          final snackbar = SnackBar(content: Text("Success"));

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
