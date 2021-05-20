import 'package:flutter/material.dart';
import 'package:garjoo/models/similar.dart';
import 'package:garjoo/widget/addToCart.dart';
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
                      var response = snapshot.data as List<Item>;
                      ProductModel.items = response;
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
                                                            .thumbnail,
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
                                                response[index].thumbnail,
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
                                                  AddToCart(
                                                    product: ProductModel
                                                        .items[index],
                                                  )
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
