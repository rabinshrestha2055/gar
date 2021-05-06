import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core.dart';

class ArrivalViewList extends StatefulWidget {
  final ValueSetter<dynamic> valueSetter;
  ArrivalViewList({Key key, this.valueSetter}) : super(key: key);

  @override
  _ArrivalViewListState createState() => _ArrivalViewListState();
}

class _ArrivalViewListState extends State<ArrivalViewList> {
  Future getArrivals;

  UserDetailsProvider user = UserDetailsProvider();
  @override
  void initState() {
    getArrivals = user.getArrivals();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Carousel1(),
        ChangeNotifierProvider<UserDetailsProvider>(
          create: (context) => UserDetailsProvider(),
          child: Consumer<UserDetailsProvider>(
              builder: (context, value, child) => FutureBuilder(
                  future: getArrivals,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      var response = snapshot.data as List<ArrivalModel>;
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(
                              parent: NeverScrollableScrollPhysics()),
                          itemCount: response.length,
                          itemBuilder: (context, index) => Card(
                              elevation: 0.4,
                              child: Stack(children: [
                                Container(
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => Navigate(
                                                        slug: response[index]
                                                            .slug,
                                                        title: response[index]
                                                            .title,
                                                        image: response[index]
                                                            .image,
                                                        price: response[index]
                                                            .price,
                                                        rating: response[index]
                                                            .rating,
                                                        storetitle:
                                                            'New Arrivals',
                                                      )));
                                        },
                                        child: Image.network(
                                            "https://api.garjoo.com" +
                                                response[index].image,
                                            width: 99,
                                            height: 120),
                                      ),
                                      SizedBox(width: 10),
                                      Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(right: 28),
                                            margin: EdgeInsets.only(right: 20),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  110, 10, 20, 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    response[index].title,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    'Rs ' +
                                                        response[index]
                                                            .price
                                                            .toString(),
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        widget.valueSetter(
                                                            response[index]);
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10),
                                                      height: 22,
                                                      width: 88,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .amber)),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width: 5),
                                                          Icon(
                                                              Icons
                                                                  .shopping_cart,
                                                              size: 13,
                                                              color: orange),
                                                          SizedBox(width: 5),
                                                          Center(
                                                            child: Text(
                                                              "Add to cart",
                                                              style: TextStyle(
                                                                  color: orange,
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ])));
                    } else {
                      return Container();
                    }
                  })),
        ),
      ],
    );
  }
}
