import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/widget/customstepper.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  var value1 = 49.99;
  var value2 = 20.58;
  var value3 = 11.00;
  var value = 81.57;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Image.asset(
            'asset/garjoologo.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(left:0.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 12),
                      child: Text(
                        'Cart',
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Row(
                        children: [
                          Image.asset(
                            'asset/fas1.jpeg',
                            height: 100,
                          ),
                          SizedBox(width: 19),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Text(
                                      '100% Organic Bo...',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Text(
                                      'Original Shoes',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Text(
                                      "\$$value1",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  Container(
                                    child: CustomStepper(
                                        lowerLimit: 0,
                                        upperLimit: 15,
                                        stepValue: 1,
                                        iconSize: 20,
                                        value: 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Row(
                        children: [
                          Image.asset(
                            'asset/fas1.jpeg',
                            height: 100,
                          ),
                          SizedBox(width: 19),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Text(
                                      '100% Organic Bo...',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Text(
                                      'Original Bag',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Text(
                                      "\$$value2",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  Container(
                                    child: CustomStepper(
                                        lowerLimit: 0,
                                        upperLimit: 15,
                                        stepValue: 1,
                                        iconSize: 20,
                                        value: 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Row(
                        children: [
                          Image.asset(
                            'asset/fas7.jpeg',
                            height: 100,
                          ),
                          SizedBox(width: 19),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Text(
                                      'Red Blue Shirt',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Text(
                                      'Original Shoes',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    child: Text(
                                      "\$$value3",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  Container(
                                    child: CustomStepper(
                                        lowerLimit: 0,
                                        upperLimit: 15,
                                        stepValue: 1,
                                        iconSize: 20,
                                        value: 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Card(
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
                        '\$$value',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '3 Items',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                  InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Checkout()));
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
                                  style: TextStyle(color: white,fontSize: 12),
                                ),
                              ),
                            )),
                      )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
