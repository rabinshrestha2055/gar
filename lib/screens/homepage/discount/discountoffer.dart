import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/homepage/discount/viewDiscount.dart';
import 'package:provider/provider.dart';

class DiscountOffers extends StatefulWidget {
  @override
  _DiscountOffersState createState() => _DiscountOffersState();
}

class _DiscountOffersState extends State<DiscountOffers> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Discounts And Offers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ViewDiscount()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right:10.0),
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
      ChangeNotifierProvider<UserDetailsProvider>(
          create: (context) => UserDetailsProvider(),
          child: Consumer<UserDetailsProvider>(
            builder: (context, value, child) => FutureBuilder(
                future: value.getDiscount(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    var response = snapshot.data as List<DiscountModel>;
                    print(response.length);
                    return Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            crossAxisCount: 3,
                            childAspectRatio: 3 / 4.4,
                          ),
                          itemCount: 6,
                          physics: ScrollPhysics(
                              parent: NeverScrollableScrollPhysics()),
                          itemBuilder: (context, index) => Container(
                              width: 126,
                              child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Stack(children: [
                                            Image.network(
                                                AppURl.path +
                                                    response[index].image,
                                                width: 99,
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
                                                          const EdgeInsets.only(
                                                              left: 3,
                                                              right: 3),
                                                      child: Text(
                                                        "Save " +
                                                            response[index]
                                                                .discount
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10),
                                                      ),
                                                    )))
                                          ])),
                                      Text(
                                        response[index].title,
                                        style: TextStyle(fontSize: 9),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          children: [
                                            Container(
                                      height: 20,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: Colors.amber)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 1),
                                          Icon(Icons.shopping_cart,
                                              size: 10, color: orange),
                                         
                                          Center(
                                            child: Text(
                                              "Add to cart",
                                              style: TextStyle(
                                                  color: orange,
                                                  fontSize: 9.5,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                          ),
                                           SizedBox(width: 1),
                                        ],
                                      ),
                                    ),
                                            Card(
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
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        size: 10,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        response[index]
                                                            .rating
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 9),
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  )))),
                    );
                  } else {
                    return Container();
                  }
                }),
          ))
    ]);

    //  SizedBox(height: 10),
  }
}
