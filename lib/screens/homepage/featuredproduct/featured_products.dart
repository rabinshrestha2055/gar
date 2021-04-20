import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
         
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ViewFeature()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right:8.0),
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
      ChangeNotifierProvider<UserDetailsProvider>(
        create: (context) => UserDetailsProvider(),
        child: Consumer<UserDetailsProvider>(
          builder: (context, value, child) => FutureBuilder(
            future: value.getFProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Container();
              } else if (snapshot.connectionState == ConnectionState.done) {
                var response = snapshot.data as List<FeaturedProductModel>;
                return Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 188,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: response.length,
                        itemBuilder: (context, index) => Container(
                            child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Container(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8),
                                        child: Image.network(
                                            "https://api.garjoo.com" +
                                                response[index].image,
                                            width: 110,
                                            height: 120)),
                                    Text(response[index].title,style: TextStyle(fontSize: 13),),
                                    Text(
                                      response[index].subtitle,
                                      style: TextStyle(fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                      Container(
                                      height: 22,
                                      width: 88,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: Colors.amber)),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Icon(Icons.shopping_cart,
                                              size: 13, color: orange),
                                          SizedBox(width: 5),
                                          Center(
                                            child: Text(
                                              "Add to cart",
                                              style: TextStyle(
                                                  color: orange,
                                                  fontSize: 13,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )))));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
      SizedBox(height: 25),
      Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MenFashion()),
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
                      child:
                          Container(
                          child: Text('Mens Fashion', style: TextStyle(color:white,fontSize: 20))),
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
                MaterialPageRoute(builder: (_) => WomenFashion()),
              );
            },
            child: Card(
              elevation: 9,
              margin: EdgeInsets.only(left: 12, right: 8),

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
                          style: TextStyle(color:white,fontSize: 20)),
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
