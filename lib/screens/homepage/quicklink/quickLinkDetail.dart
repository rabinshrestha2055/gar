import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../core.dart';

class QuickLinkDetail extends StatelessWidget {
  final String slug;
  final String storeImage;
  final String storeName;
  final String image;
  final String name;
  final String rating;
  final String storetitle;

  const QuickLinkDetail(
      {Key key,
      this.slug,
      this.image,
      this.name,
      this.storeImage,
      this.rating,
      this.storeName,
      this.storetitle})
      : super(key: key);

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
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          storetitle == 'Market' ? Carousel1() : Container(),
          QuickLinkArrival(slug:slug),
          // storetitle == 'Market' ? QuickLinkArrival() : Container(),
          // storetitle == 'Urgent Jobs' ? QuickLinkArrival() : Container(),
          storetitle != 'Market' ? ClassifiedAds() : Container(),
          // storetitle == 'Motorbikes' ? BikeArrival() : Container(),
          // storetitle == 'Hotels' ? HotelArrival() : Container(),
          // storetitle == 'Real Estate' ? RealEstateArrival(slug: slug,) : Container(),
          // storetitle == 'SmartPhone' ? MobileArrival(slug: slug) : Container(),
       
          SizedBox(height: 5),
          ChangeNotifierProvider(
              create: (context) => UserDetailsProvider(),
              child: Consumer<UserDetailsProvider>(
                builder: (context, value, child) => FutureBuilder(
                    future: value.getQuickLink(slug: slug),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        var response = snapshot.data as List<QuickLinkModel>;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Garjoo " + storetitle,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 0,
                                    crossAxisCount: 3,
                                    childAspectRatio: 3 / 4.7,
                                  ),
                                  itemCount: response.length,
                                  physics: ScrollPhysics(
                                      parent: NeverScrollableScrollPhysics()),
                                  itemBuilder: (context, index) => InkWell(
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
                                                        rating: response[index]
                                                            .rating,
                                                        storetitle: "Market",
                                                      )));
                                        },
                                        child: Container(
                                            width: 126,
                                            child: Card(
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8),
                                                        child: Stack(children: [
                                                          response[index]
                                                                      .image ==
                                                                  null
                                                              ? Image.asset(
                                                                  'asset/garjoologo.png',
                                                                  height: 99,
                                                                  width: 90,
                                                                )
                                                              : Image.network(
                                                                  AppURl.path +
                                                                      response[
                                                                              index]
                                                                          .image,
                                                                  width: 99,
                                                                  height: 120),
                                                        ])),
                                                    Text(
                                                      response[index].title,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10),
                                                    ),
                                                    Text(
                                                        'Rs ' +
                                                            response[index]
                                                                .price
                                                                .toString(),
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                        )),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: 25,
                                                            width: 70,
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
                                                                    width: 1),
                                                                Icon(
                                                                    Icons
                                                                        .shopping_cart,
                                                                    size: 10,
                                                                    color:
                                                                        orange),
                                                                Center(
                                                                  child: Text(
                                                                    "Add to cart",
                                                                    style: TextStyle(
                                                                        color:
                                                                            orange,
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 1),
                                                              ],
                                                            ),
                                                          ),
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
                    }),
              ))
        ],
      ),
    );
  }
}