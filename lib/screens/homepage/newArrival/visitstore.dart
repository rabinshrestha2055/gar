import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core.dart';

class VisitStore extends StatelessWidget {
  const VisitStore({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
        children: [ 
         
          Scaffold(
            backgroundColor: Colors.transparent,
            
            body: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Image.asset('asset/slider2.jpeg',),
                Padding(
                  padding: const EdgeInsets.only(left:10.0,top: 8,bottom: 8),
                  child: Text(
                    'Discounts And Offers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height:5),
                ChangeNotifierProvider<UserDetailsProvider>(
                    create: (context) => UserDetailsProvider(),
                    child: Consumer<UserDetailsProvider>(
                      builder: (context, value, child) => FutureBuilder(
                          future: value.getDiscount(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              var response = snapshot.data as List<DiscountModel>;
                              print(response.length);
                              return Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 0,
                                      crossAxisSpacing: 0,
                                      crossAxisCount: 3,
                                      childAspectRatio: 3 / 4.2,
                                    ),
                                    itemCount: response.length,
                                
                                    itemBuilder: (context, index) => Container(
                                        width: 114,
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
                                                          "https://api.garjoo.com" +
                                                              response[index].image,
                                                          width: 99,
                                                          height: 120),
                                                      Positioned(
                                                          top: 3,
                                                          left: 30,
                                                          child: Card(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              color: Colors.red,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left: 3,
                                                                        right: 3),
                                                                child: Text(
                                                                  "Save " +
                                                                      response[index]
                                                                          .discount
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize: 10),
                                                                ),
                                                              )))
                                                    ])),
                                                Text(
                                                  response[index].title,
                                                  style: TextStyle(fontSize: 9),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Add to Cart',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                      Card(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                          color: Colors.red,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                    left: 3,
                                                                    right: 3),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  size: 10,
                                                                  color: Colors.white,
                                                                ),
                                                                Text(
                                                                  response[index]
                                                                      .rating
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize: 9),
                                                                ),
                                                              ],
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )))),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }),
                    ))
              ],
            ),
          ),
           Positioned(child:AppBar(
             iconTheme: IconThemeData(color: white),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Icon(Icons.search,color: Colors.white,),
                )
              ],
            ),),
            Positioned(
              left:75,
              top: 90,
              child: Column(
                children: [
                  Text('Global Enterprises',style: TextStyle(fontSize:25,color:white),),
                  Text('All your fashion needs under one roof',style: TextStyle(color: white),),
                ],
              ),
            )
        ],
      ),
    );
  }
}
