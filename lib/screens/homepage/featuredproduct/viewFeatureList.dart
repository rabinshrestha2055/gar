import 'package:flutter/material.dart';
import 'package:garjoo/models/similar.dart';
import 'package:garjoo/widget/addToCart.dart';
import 'package:provider/provider.dart';

import '../../../colors.dart';
import '../../../core.dart';

class ViewFeatureList extends StatefulWidget {
  final ValueSetter<dynamic> valueSetter;
  ViewFeatureList({Key key, this.valueSetter}) : super(key: key);

  @override
  _ViewFeatureListState createState() => _ViewFeatureListState();
}

class _ViewFeatureListState extends State<ViewFeatureList> {
  UserDetailsProvider user = UserDetailsProvider();
  Future getFProduct;
  @override
  void initState() {
    getFProduct = user.getFProduct();
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
                  future: getFProduct,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Container();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      var response = snapshot.data as List<Item>;
                      ProductModel.items = response;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(
                            parent: NeverScrollableScrollPhysics()),
                        itemCount: response.length,
                        itemBuilder: (context, index) => Card(
                          elevation: 0.4,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, bottom: 8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Navigate(
                                                title: response[index].title,
                                                image:
                                                    response[index].thumbnail,
                                                slug: response[index].slug,
                                                price: response[index].price,
                                                rating: response[index].rating,
                                                storetitle: 'Featured Products',
                                              )),
                                    );
                                  },
                                  child: Image.network(
                                    "https://api.garjoo.com" +
                                        response[index].thumbnail,
                                    height: 120,
                                    width: 140,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    response[index].title,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Rs ' + response[index].price.toString(),
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    width: 40,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(children: [
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: white,
                                      ),
                                      Text(
                                        response[index].rating == null
                                            ? "N/A"
                                            : response[index].rating.toString(),
                                        style: TextStyle(color: white),
                                      )
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  AddToCart(
                                    product: ProductModel.items[index],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  })),
        ),
      ],
    );
  }
}
