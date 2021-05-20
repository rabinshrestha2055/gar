import 'package:flutter/material.dart';
import 'package:garjoo/models/similar.dart';
import 'package:garjoo/widget/addToCart.dart';
import 'package:provider/provider.dart';

import '../../../core.dart';

class ViewDiscountList extends StatefulWidget {
  final ValueSetter<dynamic> valueSetter;
  ViewDiscountList({Key key, this.valueSetter}) : super(key: key);

  @override
  _ViewDiscountListState createState() => _ViewDiscountListState();
}

class _ViewDiscountListState extends State<ViewDiscountList> {
  double discountPrice;
  double finalPrice;
  bool loading;
  Future viewDiscount;
  UserDetailsProvider user = UserDetailsProvider();
  @override
  void initState() {
    viewDiscount = user.getDiscount();
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
                  future: viewDiscount,
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
                          itemBuilder: (context, index) {
                            discountPrice = response[index].price *
                                response[index].rate /
                                100;

                            finalPrice = response[index].price - discountPrice;

                            return Card(
                              elevation: 0.4,
                              child: Stack(
                                children: [
                                  Container(
                                      child: Stack(children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Navigate(
                                                      title:
                                                          response[index].title,
                                                      image: response[index]
                                                          .thumbnail,
                                                      slug:
                                                          response[index].slug,
                                                      price:
                                                          response[index].price,
                                                      rating: response[index]
                                                          .rating,
                                                      storetitle:
                                                          'Discount And Offers',
                                                    )));
                                      },
                                      child: Image.network(
                                          "https://api.garjoo.com" +
                                              response[index].thumbnail,
                                          width: 99,
                                          height: 140),
                                    ),
                                    Positioned(
                                        top: 2,
                                        right: 30,
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
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
                                                            .rate
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
                                                overflow: TextOverflow.ellipsis,
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
                                                        finalPrice.toString(),
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 8),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AddToCart(
                                                    product: ProductModel
                                                        .items[index],
                                                  )
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
                            );
                          });
                    } else {
                      return Container();
                    }
                  })),
        ),
      ],
    );
  }
}
