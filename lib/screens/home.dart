import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/models/similar.dart';
import 'package:garjoo/widget/customAppBar.dart';

import '../core.dart';

class Home extends StatefulWidget {
  final int id;
  final String title;
  final String email;
  final String userName;
  Home({Key key, this.title, this.email, this.userName, this.id})
      : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future myMarket;

  UserDetailsProvider user = UserDetailsProvider();
  @override
  void initState() {
    myMarket = user.getMarket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(1)),
          child: Drawer(
            child: FutureBuilder(
                future: myMarket,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    var response = snapshot.data as List<Item>;

                    return ListView.builder(
                      itemCount: response.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8, left: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.orange,
                                      child: Icon(Icons.shopping_bag,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      response[index].label,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 30),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: customAppBar(
          context: context, email: widget.email, userName: widget.userName),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Category(),

            //Carousel
            Carousel1(),

            SizedBox(height: 15),

            QuickLink(),
            //New Arivals
            SizedBox(
              height: 15,
            ),
            Arrival(
              id: widget.id,
              email: widget.email,
              userName: widget.userName,
            ),
            SizedBox(height: 15),

            //Discount

            DiscountOffers(
              email: widget.email,
              userName: widget.userName,
            ),

            SizedBox(height: 20),

            //Ads
            ClassifiedAds(),
            SizedBox(height: 5),
            //Featured Categories
            FeaturedCategory(),

            SizedBox(height: 5),

            //Featured Product
            FeaturedProduct(
              email: widget.email,
              userName: widget.userName,
            ),

            ClassifiedAds(),

            SizedBox(height: 15),
          ]),
        ],
      ),
    );
  }
}

void openContainer() {
  Container(
    width: 100,
    height: 100,
    color: Colors.red,
    child: Text('heloo'),
  );
}
