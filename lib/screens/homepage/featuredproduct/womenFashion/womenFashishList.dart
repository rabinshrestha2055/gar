import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core.dart';

class WomenFashionList extends StatefulWidget {
  final ValueSetter<dynamic> valueSetter;

  WomenFashionList({
    Key key,
    this.valueSetter,
  }) : super(key: key);

  @override
  _WomenFashionListState createState() => _WomenFashionListState();
}

class _WomenFashionListState extends State<WomenFashionList> {
  Future getWomenProduct;
  UserDetailsProvider user = UserDetailsProvider();
  @override
  void initState() {
    getWomenProduct = user.getWomenProduct();
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
                  future: getWomenProduct,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Container();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      var response = snapshot.data as List<WomenFashionModel>;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Womens Fashion',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView.builder(
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
                                                          title: response[index]
                                                              .title,
                                                          image: response[index]
                                                              .image,
                                                          slug: response[index]
                                                              .slug,
                                                          price: response[index]
                                                              .price,
                                                          rating:
                                                              response[index]
                                                                  .rating,
                                                          storetitle:
                                                              'Womens Products',
                                                        )),
                                              );
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
                                                padding:
                                                    EdgeInsets.only(right: 28),
                                                margin:
                                                    EdgeInsets.only(right: 20),
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      110, 10, 20, 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        response[index].title,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                      SizedBox(height: 5),
                                                      Container(
                                                        width: 40,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Row(children: [
                                                          Icon(
                                                            Icons.star,
                                                            size: 12,
                                                            color: white,
                                                          ),
                                                          Text(
                                                            response[index]
                                                                .rating,
                                                            style: TextStyle(
                                                                color: white),
                                                          )
                                                        ]),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          widget.valueSetter(
                                                              response[index]);
                                                        },
                                                        child: Container(
                                                          height: 22,
                                                          width: 92,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .amber)),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                  width: 5),
                                                              Icon(
                                                                  Icons
                                                                      .shopping_cart,
                                                                  size: 13,
                                                                  color:
                                                                      orange),
                                                              SizedBox(
                                                                  width: 5),
                                                              Center(
                                                                child: Text(
                                                                  "Add to cart",
                                                                  style: TextStyle(
                                                                      color:
                                                                          orange,
                                                                      fontSize:
                                                                          13,
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
                                  ]))),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  })),
        ),
      ],
    );
  }
}
