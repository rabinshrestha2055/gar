import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class ViewDiscount extends StatefulWidget {
  ViewDiscount({Key key}) : super(key: key);

  @override
  _ViewDiscountState createState() => _ViewDiscountState();
}

class _ViewDiscountState extends State<ViewDiscount> {
  double discountPrice;
  double finalPrice;
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(Icons.search),
              onTap: () {},
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              child: Icon(Icons.shopping_cart_outlined),
              onTap: () {},
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Carousel1(),
          ChangeNotifierProvider<UserDetailsProvider>(
            create: (context) => UserDetailsProvider(),
            child: Consumer<UserDetailsProvider>(
                builder: (context, value, child) => FutureBuilder(
                    future: value.getDiscount(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        var response = snapshot.data as List<DiscountModel>;
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(
                                parent: NeverScrollableScrollPhysics()),
                            itemCount: response.length,
                            itemBuilder: (context, index) {
                              discountPrice = response[index].price *
                                  int.parse(response[index].rating) /
                                  100;

                              finalPrice =
                                  response[index].price - discountPrice;
                              print(finalPrice.toString());
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Navigate(
                                                title: response[index].title,
                                                image: response[index].image,
                                                slug: response[index].slug,
                                                price: response[index].price,
                                                rating: response[index].rating,
                                                storetitle:
                                                    'Discount And Offers',
                                              )));
                                },
                                child: Card(
                                  elevation: 0.4,
                                  child: Stack(
                                    children: [
                                      Container(
                                          child: Stack(children: [
                                        Image.network(
                                            "https://api.garjoo.com" +
                                                response[index].image,
                                            width: 99,
                                            height: 140),
                                        Positioned(
                                            top: 2,
                                            right: 30,
                                            child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                color: Colors.red,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 3, right: 3),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'Save ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        response[index]
                                                                .rating
                                                                .toString() +
                                                            '%',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 11),
                                                      ),
                                                    ],
                                                  ),
                                                )))
                                      ])),
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
                                                  SizedBox(height: 8),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Rs ' +
                                                            response[index]
                                                                .price
                                                                .toString(),
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            color: Colors.grey),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Rs ' +
                                                            finalPrice
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 22,
                                                        width: 88,
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
                                                                    color:
                                                                        orange,
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Container();
                      }
                    })),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          return showDialog(
            context: context,
            builder: (ctx) => Filter(),
          );
        },
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
