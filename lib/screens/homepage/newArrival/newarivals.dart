import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/homepage/newArrival/arrivalView.dart';
import 'package:provider/provider.dart';

class Arrival extends StatefulWidget {
  final ValueSetter<dynamic> valueSetter;
  var cart;
  int sum;
  Arrival({Key key, this.valueSetter, this.cart, this.sum}) : super(key: key);

  @override
  _ArrivalState createState() => _ArrivalState();
}

class _ArrivalState extends State<Arrival> {
  final ArrivalModel arrivalModel = ArrivalModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserDetailsProvider(),
      child: Consumer<UserDetailsProvider>(
        builder: (context, value, child) => FutureBuilder(
            future: value.getArrivals(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                var response = snapshot.data as List<ArrivalModel>;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New Arivals',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ViewArrival(
                                    valueSetter: (selectedProduct) {
                                      setState(() {
                                        widget.cart.add(selectedProduct);
                                        widget.cart.forEach((element) {
                                          print(element.price);
                                          widget.sum =
                                              widget.sum + element.price;
                                        });
                                      });
                                    },
                                    cart: widget.cart,
                                    sum: widget.sum,
                                  );
                                },
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
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
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            crossAxisCount: 3,
                            childAspectRatio: 3 / 4.8,
                          ),
                          physics: ScrollPhysics(
                              parent: NeverScrollableScrollPhysics()),
                          itemCount: 6,
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
                                              storetitle: 'New Arrivals',
                                            )),
                                  );
                                },
                                child: Container(
                                    child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 4),
                                          child: Image.network(
                                              "https://api.garjoo.com" +
                                                  response[index].image,
                                              width: 97.3,
                                              height: 120)),
                                      Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            response[index].title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      RatingBar.builder(
                                        ignoreGestures: true,
                                        initialRating:
                                            response[index].rating.toString() ==
                                                    'null'
                                                ? 0.0
                                                : double.parse(
                                                    response[index].rating),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 10,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      SizedBox(height: 5),
                                      InkWell(
                                        onTap: () {
                                          widget.valueSetter(response[index]);
                                        },
                                        child: Container(
                                          height: 22,
                                          width: 88,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.amber)),
                                          child: Row(
                                            children: [
                                              SizedBox(width: 5),
                                              Icon(Icons.shopping_cart,
                                                  size: 11, color: orange),
                                              SizedBox(width: 5),
                                              Center(
                                                child: Text(
                                                  "Add to cart",
                                                  style: TextStyle(
                                                      color: orange,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                              )),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Container(),
                );
              }
            }),
      ),
    );
  }
}
