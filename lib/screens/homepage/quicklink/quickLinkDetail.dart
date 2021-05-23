import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/controller/provider/appurl%20.dart';
import 'package:garjoo/filter/marketFilter.dart';
import 'package:garjoo/models/similar.dart';
import 'package:garjoo/widget/addToCart.dart';
import 'package:garjoo/widget/customAppBar.dart';
import 'package:garjoo/widget/viewDetails.dart';

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
  final String buttontitle;

  const QuickLinkDetail(
      {Key key,
      this.slug,
      this.image,
      this.name,
      this.storeImage,
      this.rating,
      this.storeName,
      this.buttontitle,
      this.storetitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          context: context,
        ),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            storetitle == 'Market' ? Carousel1() : Container(),
            QuickLinkArrival(
              slug: slug,
              buttonTitle: buttontitle,
            ),
            storetitle != 'Market' ? ClassifiedAds() : Container(),
            SizedBox(height: 5),
            ChangeNotifierProvider(
                create: (context) => UserDetailsProvider(),
                child: Consumer<UserDetailsProvider>(
                  builder: (context, value, child) => FutureBuilder(
                      future: value.getQuickLink1(slug: slug),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          var response = snapshot.data as List<Item>;
                          ProductModel.items = response;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  "Garjoo " + storetitle,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                                                              .thumbnail,
                                                          slug: response[index]
                                                              .slug,
                                                          price: response[index]
                                                              .price,
                                                          rating:
                                                              response[index]
                                                                  .rating
                                                                  .toString(),
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
                                                          child:
                                                              Stack(children: [
                                                            response[index]
                                                                        .thumbnail ==
                                                                    null
                                                                ? Image.asset(
                                                                    'asset/garjoologo.png',
                                                                    height: 99,
                                                                    width: 90,
                                                                  )
                                                                : Image.network(
                                                                    AppURl.path +
                                                                        response[index]
                                                                            .thumbnail,
                                                                    width: 99,
                                                                    height:
                                                                        120),
                                                          ])),
                                                      Text(
                                                        response[index].title,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                      storetitle == "Market"
                                                          ? AddToCart(
                                                              product:
                                                                  ProductModel
                                                                          .items[
                                                                      index],
                                                            )
                                                          : ViewDetails(
                                                              title: storetitle,
                                                            )
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: orange,
          child: Icon(
            CupertinoIcons.search,
          ),
          onPressed: () {
            return showDialog(
              context: context,
              builder: (ctx) =>
                  storetitle == "Market" ? MarketFilter() : SizedBox(),
            );
          },
        ));
  }
}
