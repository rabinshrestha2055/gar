import 'package:flutter/material.dart';
import 'package:garjoo/models/datamodel.dart';
import 'package:garjoo/models/visitstoremodel.dart';
import 'package:provider/provider.dart';

import '../../../core.dart';

class VisitStore extends StatelessWidget {
  final String slug;

  final String image;
  final String name;

  const VisitStore({Key key, this.slug, this.image, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          ChangeNotifierProvider<UserDetailsProvider>(
            create: (context) => UserDetailsProvider(),
            child: Consumer<UserDetailsProvider>(
              builder: (context, value, child) => FutureBuilder(
                  future: value.getStoreProduct(slug: slug),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      var response = snapshot.data as StoreModel;

                      return ListView.builder(
                        itemBuilder: (context, index) => Container(
                          height: MediaQuery.of(context).size.height,
                          child: Stack(
                            children: [
                              Image.network(response.image),
                              Positioned(
                                child: AppBar(
                                  iconTheme: IconThemeData(color: white),
                                  elevation: 0.0,
                                  backgroundColor: Colors.transparent,
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 75,
                                top: 60,
                                child: Column(
                                  children: [
                                    Text(
                                      'hlooo',
                                      style:
                                          TextStyle(fontSize: 25, color: white),
                                    ),
                                    Text(
                                      'All your fashion needs under one roof',
                                      style: TextStyle(color: white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Container(),
                      );
                    }
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 8, bottom: 8),
            child: Text(
              'Discounts And Offers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          ChangeNotifierProvider<UserDetailsProvider>(
              create: (context) => UserDetailsProvider(),
              child: Consumer<UserDetailsProvider>(
                builder: (context, value, child) => FutureBuilder(
                    future: value.getData(slug: slug),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        var response = snapshot.data as List<DataModel>;
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
                                childAspectRatio: 3 / 4.7,
                              ),
                              itemCount: response.length,
                              physics: ScrollPhysics(
                                  parent: NeverScrollableScrollPhysics()),
                              itemBuilder: (context, index) => Container(
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
                                                        response[index].image,
                                                    width: 99,
                                                    height: 120),
                                              ])),
                                          Text(
                                            response[index].name,
                                            style: TextStyle(fontSize: 10),
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
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 25,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: Colors.amber)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(width: 1),
                                                      Icon(Icons.shopping_cart,
                                                          size: 10,
                                                          color: orange),
                                                      Center(
                                                        child: Text(
                                                          "Add to cart",
                                                          style: TextStyle(
                                                              color: orange,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(width: 1),
                                                    ],
                                                  ),
                                                ),
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
        ],
      ),
    );
  }
}
