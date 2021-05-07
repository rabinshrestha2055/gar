import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class QuickLinkArrival extends StatelessWidget {
  final String slug;
  final String buttonTitle;
  const QuickLinkArrival({Key key, this.slug, this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 10),
      ChangeNotifierProvider<UserDetailsProvider>(
        create: (context) => UserDetailsProvider(),
        child: Consumer<UserDetailsProvider>(
          builder: (context, value, child) => FutureBuilder(
            future: value.getQuickLink(slug: slug),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Container();
              } else if (snapshot.connectionState == ConnectionState.done) {
                var response = snapshot.data as List<QuickLinkModel>;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Recently Listed',
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
                                                title: response[index].title,
                                                image: response[index].image,
                                                slug: response[index].slug,
                                                price: response[index].price,
                                                rating: response[index].rating,
                                                storetitle: 'Featured Product',
                                              )),
                                    );
                                  },
                                  child: Container(
                                      child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 8, right: 8),
                                                  child: response[index]
                                                              .image ==
                                                          null
                                                      ? Image.asset(
                                                          'asset/garjoologo.png',
                                                          height: 120,
                                                          width: 110,
                                                        )
                                                      : Image.network(
                                                          "https://api.garjoo.com" +
                                                              response[index]
                                                                  .image,
                                                          width: 110,
                                                          height: 120)),
                                              Container(
                                                width: 50,
                                                child: Text(
                                                  response[index].title,
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Container(
                                                height: 22,
                                                width: 92,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.amber)),
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 5),
                                                    Icon(Icons.shopping_cart,
                                                        size: 13,
                                                        color: orange),
                                                    SizedBox(width: 5),
                                                    Center(
                                                      child: Text(
                                                        buttonTitle,
                                                        style: TextStyle(
                                                            color: orange,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ))),
                                ))),
                  ],
                );
              } else {
                return slug != 'market?'
                    ? LinearProgressIndicator(
                        minHeight: 2,
                      )
                    : Container();
              }
            },
          ),
        ),
      ),
      SizedBox(height: 5),
    ]);
  }
}
