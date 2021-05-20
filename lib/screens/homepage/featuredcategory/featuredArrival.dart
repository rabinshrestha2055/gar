import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/models/similar.dart';
import 'package:provider/provider.dart';

class FeaturedCatArrival extends StatelessWidget {
  final String slug;
  const FeaturedCatArrival({Key key, this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 10),
      ChangeNotifierProvider<UserDetailsProvider>(
        create: (context) => UserDetailsProvider(),
        child: Consumer<UserDetailsProvider>(
          builder: (context, value, child) => FutureBuilder(
            future: value.getQuickLink1(slug: slug),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Container();
              } else if (snapshot.connectionState == ConnectionState.done) {
                var response = snapshot.data as List<Item>;

                return response[0].slug != 'garjoo not available'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'New Category Arrivals',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              width: MediaQuery.of(context).size.width,
                              height: 188,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: response.length,
                                  itemBuilder: (context, index) => InkWell(
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
                                                          'Featured Cateogories',
                                                    )),
                                          );
                                        },
                                        child: Container(
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
                                                                left: 8,
                                                                right: 8),
                                                        child: response[index]
                                                                    .thumbnail ==
                                                                null
                                                            ? Image.asset(
                                                                'asset/garjoologo.png',
                                                                height: 99,
                                                                width: 90,
                                                              )
                                                            : Image.network(
                                                                "https://api.garjoo.com" +
                                                                    response[
                                                                            index]
                                                                        .thumbnail,
                                                                width: 110,
                                                                height: 120)),
                                                    Container(
                                                      width: 50,
                                                      child: Text(
                                                        response[index].title,
                                                        style: TextStyle(
                                                            fontSize: 13),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                    Container(
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
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ))),
                                      ))),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(response[0].title),
                      );
              } else {
                return LinearProgressIndicator(
                  minHeight: 2,
                );
              }
            },
          ),
        ),
      ),
      SizedBox(height: 5),
    ]);
  }
}
