import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showContainer = false;
   bool showContainer1 = false;
  @override
  void initState() {
    super.initState();
    showContainer = false;
  }

  void show(int id) {
    setState(() {
      id == 7 ? showContainer = !showContainer : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: showContainer == false
            ? MediaQuery.of(context).size.width * 0.467
            : MediaQuery.of(context).size.width * 0.95,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(1)),
          child: Drawer(
            child: ChangeNotifierProvider<UserDetailsProvider>(
              create: (context) => UserDetailsProvider(),
              child: Consumer<UserDetailsProvider>(
                builder: (context, value, child) => FutureBuilder(
                    future: value.getMarket(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        var response = snapshot.data as List<MarketModel>;

                        return ListView.builder(
                          itemCount: response.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Column(
                            children: [
                              
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, left: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            // show(response[index].id);
                                          },
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.orange,
                                            child: Icon(Icons.shopping_bag,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Text(
                                          response[index].label,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Visibility(
                                      visible: showContainer1,
                                      child: Card(
                                          elevation: 2,
                                          child: Container(
                                            width: 200,
                                            // height: 89,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,

                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text("Mens Fashion"),
                                                  ),
                                                  ExpansionTile(
                                                    childrenPadding:
                                                        EdgeInsets.only(
                                                            right: 140),
                                                    title: Text('Shirts'),
                                                    children: [
                                                      Container(
                                                        height:100,

                                                        child: ListView(
                                                          shrinkWrap: true,
                                                          children: [
                                                            
                                                            Text('rabin'),
                                                         
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(height: 1),
                                                  ExpansionTile(
                                                    childrenPadding:
                                                        EdgeInsets.only(
                                                            right: 140),
                                                    title: Text('Jacket'),
                                                    children: [
                                                      Text('rabin'),
                                                      Text('rabin'),
                                                      Text('rabin'),
                                                      Text('rabin'),
                                                    ],
                                                  ),
                                                  Divider(height: 1),
                                                  ExpansionTile(
                                                    childrenPadding:
                                                        EdgeInsets.only(
                                                            right: 140),
                                                    title: Text('Pants'),
                                                    children: [
                                                      Text('rabin'),
                                                      Text('rabin'),
                                                      Text('rabin'),
                                                      Text('rabin'),
                                                    ],
                                                  ),
                                                  Divider(height: 1),
                                                  ExpansionTile(
                                                    childrenPadding:
                                                        EdgeInsets.only(
                                                            right: 140),
                                                    title: Text('Jeans'),
                                                    children: [
                                                      Text('rabin'),
                                                      Text('rabin'),
                                                      Text('rabin'),
                                                      Text('rabin'),
                                                    ],
                                                  ),
                                                  Divider(height: 1),
                                                ]),
                                          )))
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
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
        actions: [
          Stack(children: [
            Positioned(
              top: 22,
              left: 2,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.red,
                child: Text(
                  '5',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
            IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {}),
          ]),
          Stack(children: [
            Positioned(
              top: 24,
              left: 8,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.red,
                child: Text(
                  '10',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
            IconButton(
                icon: Icon(Icons.notifications_outlined), onPressed: () {}),
          ]),
        ],
      ),
      body: ListView(
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
            Arrival(),
            SizedBox(height: 15),

            //Discount

            DiscountOffers(),

            SizedBox(height: 20),

            //Ads
            ClassifiedAds(),

            //Featured Categories
            FeaturedCategory(),

            SizedBox(height: 10),

            //Featured Product
            FeaturedProduct(),

            SizedBox(height: 25),
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
