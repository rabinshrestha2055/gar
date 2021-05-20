import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/models/similar.dart';
import 'package:garjoo/widget/customAppBar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context: context),
        body: ChangeNotifierProvider(
          create: (context) => UserDetailsProvider(),
          child: Consumer<UserDetailsProvider>(
            builder: (context, value, child) => FutureBuilder(
                future: value.getDetails(slug: widget.slug),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Container();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    var response = snapshot.data as Item;

                    return ListView(
                      scrollDirection: Axis.vertical,
                      physics:
                          ScrollPhysics(parent: NeverScrollableScrollPhysics()),
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
                                        widget.rating.toString(),
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
                                Expanded(
                                  flex: 4,
                                  child: TabBarView(
                                      physics: ScrollPhysics(
                                          parent:
                                              NeverScrollableScrollPhysics()),
                                      controller: _tabController,
                                      children: [
                                        ProductNA(
                                          slug: widget.slug,
                                          pAddress: response.address1,
                                          sAddress: response.address2,
                                          location: response.location,
                                          storeslug: response.store['slug'],
                                          view: response.views,
                                          time: response.time,
                                          count: response.count,
                                          storeImage: response.store['profile'],
                                          storeName: response.store['name'],
                                          rating: widget.rating.toString(),
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
