import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/models/similar.dart';
import 'package:garjoo/widget/addToCart.dart';

class FeaturedProduct extends StatefulWidget {
  var email;
  var userName;
  FeaturedProduct({Key key, this.email, this.userName}) : super(key: key);

  @override
  _FeaturedProductState createState() => _FeaturedProductState();
}

class _FeaturedProductState extends State<FeaturedProduct> {
  Future getFProduct;
  UserDetailsProvider user = UserDetailsProvider();
  @override
  void initState() {
    getFProduct = user.getFProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 10),
      FutureBuilder(
        future: getFProduct,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container();
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
                        'Featured Products',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ViewFeature(
                                      email: widget.email,
                                      userName: widget.userName,
                                    )),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            'View More',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 170,
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
                                            image: response[index].thumbnail,
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
                                              child: Image.network(
                                                  "https://api.garjoo.com" +
                                                      response[index].thumbnail,
                                                  width: 110,
                                                  height: 120)),
                                          Container(
                                            width: 50,
                                            child: Text(
                                              response[index].title,
                                              style: TextStyle(fontSize: 13),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                          AddToCart(
                                            product: ProductModel.items[index],
                                          )
                                        ],
                                      ))),
                            ))),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
      SizedBox(height: 25),
      Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MenFashion(
                          email: widget.email,
                          username: widget.userName,
                        )),
              );
            },
            child: Container(
              child: Stack(children: [
                Center(
                    child: Image.asset(
                  "asset/men1.jpeg",
                  height: 180,
                  width: 340,
                  fit: BoxFit.cover,
                )),
                Positioned(
                    bottom: 5,
                    left: 120,
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Container(
                          child: Text('Mens Fashion',
                              style: TextStyle(color: white, fontSize: 20))),
                    ))
              ]),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
      Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => WomenFashion(
                          email: widget.email,
                          userName: widget.userName,
                        )),
              );
            },
            child: Container(
              child: Stack(children: [
                Center(
                    child: Image.asset(
                  "asset/female.jpeg",
                  height: 180,
                  width: 340,
                  fit: BoxFit.cover,
                )),
                Positioned(
                    bottom: 15,
                    left: 100,
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text('Womens Fashion',
                          style: TextStyle(color: white, fontSize: 20)),
                    ))
              ]),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    ]);
  }
}
