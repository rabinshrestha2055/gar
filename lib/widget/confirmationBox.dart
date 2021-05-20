import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:garjoo/controller/provider/userProvider.dart';
import 'package:garjoo/models/imePay.dart';
import 'package:garjoo/models/imePayWeb.dart';

class ConfirmationBox extends StatefulWidget {
  final sum;
  ConfirmationBox({Key key, this.sum}) : super(key: key);

  @override
  _ConfirmationBoxState createState() => _ConfirmationBoxState();
}

class _ConfirmationBoxState extends State<ConfirmationBox> {
  UserDetailsProvider user = UserDetailsProvider();
  @override
  Widget build(BuildContext context) {
    print(widget.sum);
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
                      var imeModel = IMEPAYRequestModel(
                        amount: widget.sum,
                        refId: generate().toString(),
                      );
                      user
                          .imePay(imepayRequestModel: imeModel)
                          .then((response) {
                        if (response.statusCode == 200) {
                          var res = imeWebModelFromJson(response.body);
                          Codec<String, String> stringToBase64 =
                              utf8.fuse(base64);
                          String encoded = stringToBase64.encode(response.body);
                          print(encoded);
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

  int generate() {
    var random = Random();
    var randomNumber = random.nextInt(9000000) + 1000000;
    return randomNumber;
  }
}
