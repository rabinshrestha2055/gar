import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class ReviewNA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 1.5,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.blue[100],
                        child: Text(
                          'JD',
                          style: TextStyle(
                              color: Colors.blue[300],
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 140.0),
                            child: Text(
                              '5 March, 2021',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 118.0, bottom: 2),
                            child: Text(
                              'Jane Doe',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Container(
                              width: 180,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Card(
                  elevation: 1.0,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Method",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Home Delivery",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Days",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "4-6 days  ",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Cash on  Delivery",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Enjoy Free Shipping promotion with minimum 2 times'),
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              Card(
                  elevation: 1.0,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Return & Warranty",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "7 Days Return",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Enjoy Free Shipping promotion with minimum 2 times'),
                      ],
                    ),
                  )),
              SizedBox(height: 10),
                Padding(
                padding: const EdgeInsets.only(right:2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,top: 8,bottom: 8),
                      child: Container(
                        height: 48,
                        width: 155,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 18),
                              Text('Buy Now'),
                              SizedBox(width: 8),
                              CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.arrow_upward_outlined,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Container(
                        height: 48,
                        width: 151,
                        child: Card(
                          color: Colors.red[300],
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                'ADD TO CART',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                              CircleAvatar(
                                  radius: 17,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Colors.red[300],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                  elevation: 0.18,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 15.0,
                              backgroundColor: Colors.purpleAccent,
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                size: 18.0,
                              )),
                          SizedBox(width: 5),
                          Text(
                            "The Next Trends",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Products',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text('25'),
                                  ],
                                ),
                                SizedBox(width: 50),
                                Container(
                                  height: 35,
                                  width: 1,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Views',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text('9'),
                                  ],
                                ),
                                SizedBox(width: 30),
                                Container(
                                  height: 35,
                                  width: 1,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'On Garjoo',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text('3 months ago')
                              ],
                            ),
                          ]),
                      SizedBox(height: 10),
                       InkWell(
                        child: Text('Visit Store',
                            style: TextStyle(color: Colors.red)),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => VisitStore()));
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  )),
              SizedBox(height: 10),
             
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
