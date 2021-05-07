import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/models/detailsmodel.dart';
import 'package:provider/provider.dart';

class Navigate extends StatefulWidget {
  final title;
  final int id;
  final int productId;
  final price;
  final image;
  final slug;
  final rating;
  final storetitle;
  final description;
  final email;

  Navigate(
      {Key key,
      this.productId,
      this.image,
      this.id,
      this.price,
      this.email,
      this.title,
      this.slug,
      this.rating,
      this.storetitle,
      this.description})
      : super(key: key);

  @override
  _NavigateState createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  TabController _tabController;

  // double discountPrice(double price, double percentage) {
  //   var disprice = (price * percentage) / 100;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              'asset/garjoologo.png',
              height: 60,
              width: 110,
            ),
          ),
          actions: [
            Stack(children: [
              Positioned(
                top: 5,
                left: 8,
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.red,
                  child: Text(
                    '10',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: orange,
                  onPressed: () {}),
            ]),
          ],
        ),
        body: ChangeNotifierProvider(
          create: (context) => UserDetailsProvider(),
          child: Consumer<UserDetailsProvider>(
            builder: (context, value, child) => FutureBuilder(
                future: value.getDetails(slug: widget.slug),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Container();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    var response = snapshot.data as DetailsModel;

                    return ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Center(
                            child: Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rs ' + widget.price.toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.red,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        widget.rating,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        )),
                        SizedBox(height: 10),
                        Container(
                            height: 180,
                            width: 200,
                            child: Image.network(
                              "https://api.garjoo.com" + widget.image,
                              alignment: Alignment.topCenter,
                              width: 300,
                              height: 250,
                              fit: BoxFit.contain,
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.57,
                          // padding: const EdgeInsets.only(
                          //     top: 10, right: 10, left: 10),
                          child: DefaultTabController(
                            initialIndex: 0,
                            length: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 15, right: 1),
                                  height: 35,
                                  child: TabBar(
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: Colors.red[400],
                                    ),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    labelPadding: EdgeInsets.all(0),
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.black,
                                    controller: _tabController,
                                    tabs: [
                                      Tab(
                                        child: Text('Product',
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                      Tab(
                                          child: Text('Description',
                                              style: TextStyle(fontSize: 14))),
                                      Tab(
                                          child: Text('Reviews',
                                              style: TextStyle(fontSize: 14))),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Flexible(
                                  child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        ProductNA(
                                          slug: widget.slug,
                                          pAddress: response.pAddress,
                                          sAddress: response.sAddress,
                                          location: response.location,
                                          storeslug: response.storeslug,
                                          view: response.views,
                                          time: response.time,
                                          count: response.count,
                                          storeImage: response.storeImage,
                                          storeName: response.storeName,
                                          rating: widget.rating,
                                          storetitle: widget.storetitle,
                                        ),
                                        DescriptionNA(
                                          description: response.description,
                                        ),
                                        ReviewNA(
                                          productId: widget.productId,
                                          id: widget.id,
                                          email: widget.email,
                                        ),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return LinearProgressIndicator(
                      minHeight: 2,
                    );
                  }
                }),
          ),
        ));
  }
}
