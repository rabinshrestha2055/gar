import 'package:flutter/material.dart';

import 'package:garjoo/core.dart';
import 'package:garjoo/models/similar.dart';
import 'package:garjoo/screens/homepage/discount/viewDiscount.dart';
import 'package:garjoo/widget/addToCart.dart';

import '../../../core.dart';

class DiscountOffers extends StatefulWidget {
  var email;
  var userName;
  DiscountOffers({Key key, this.email, this.userName}) : super(key: key);
  @override
  DiscountOffersState createState() => DiscountOffersState();
}

class DiscountOffersState extends State<DiscountOffers> {
  Future myDiscount;
  UserDetailsProvider user = UserDetailsProvider();
  @override
  void initState() {
    myDiscount = user.getDiscount();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: myDiscount,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            ProductModel.items = snapshot.data as List<Item>;
            var response = ProductModel.items;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discounts And Offers',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ViewDiscount(
                                      userName: widget.userName,
                                      email: widget.email,
                                    )),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            'View More',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        crossAxisCount: 3,
                        childAspectRatio: 3 / 4.45,
                      ),
                      itemCount: 6,
                      physics:
                          ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Navigate(
                                            title: response[index].title,
                                            image: response[index].thumbnail,
                                            slug: response[index].slug,
                                            price: response[index].price,
                                            rating: response[index].rate,
                                            storetitle: 'Discount And Offers',
                                          )));
                            },
                            child: Container(
                                width: 126,
                                child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Stack(children: [
                                              Image.network(
                                                  AppURl.path +
                                                      response[index].thumbnail,
                                                  width: 103,
                                                  height: 120),
                                              Positioned(
                                                  top: 3,
                                                  left: 30,
                                                  child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      color: Colors.red,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 3,
                                                                right: 3),
                                                        child: Text(
                                                          "Save " +
                                                              response[index]
                                                                  .rate
                                                                  .toString() +
                                                              "%",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10),
                                                        ),
                                                      )))
                                            ])),
                                        Text(
                                          response[index].title,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        SizedBox(height: 2),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              AddToCart(
                                                product:
                                                    ProductModel.items[index],
                                              ),
                                              SizedBox(width: 2),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))),
                          )),
                ),
              ],
            );
          } else {
            return Container();
          }
        });

    //  SizedBox(height: 10),
  }
}
