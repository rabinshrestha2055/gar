import 'package:flutter/material.dart';

import '../../core.dart';

class ViewAds extends StatelessWidget {
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
        body: ListView(
          children: [
            SizedBox(height: 8),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 8, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Search by Name'),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.only(left: 15, right: 15),
                elevation: 1,
                child: Padding(
                    padding: EdgeInsets.only(left: 1.0, bottom: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Reciever Number:'),
                              Text('9860123115')
                            ],
                          ),
                          Row(
                            children: [
                              Text('Ordered on:'),
                              Text('2 weeks ago'),
                            ],
                          ),
                          SizedBox(height: 12),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Expanded(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Recievers Name',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      'Rabin',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Expanded(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Shopping Address',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      'Kathmandu',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Expanded(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Shopping Charge',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      '0',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Expanded(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Grand Total',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      '500',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ]),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    color: red,
                                    onPressed: () {}),
                                MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    color: blue,
                                    child: Text(
                                      'Make Featured',
                                      style: TextStyle(color: white),
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ));
  }
}
