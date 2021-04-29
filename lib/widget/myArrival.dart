import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class MyArrival extends StatelessWidget {
  const MyArrival({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    
      SizedBox(height: 10),
      ChangeNotifierProvider<UserDetailsProvider>(
        create: (context) => UserDetailsProvider(),
        child: Consumer<UserDetailsProvider>(
          builder: (context, value, child) => FutureBuilder(
            future: value.getStoreLimitedProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return null;
              }else if(snapshot.connectionState==ConnectionState.none){
                return Center(child: Text('No Previews Available',style: TextStyle(color: Colors.black),));
              }
              else if (snapshot.connectionState == ConnectionState.done) {
                var response = snapshot.data as List<LimitedProduct>;
          
                return Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 188,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: response.length,
                        itemBuilder: (context, index) { 
                          // print(response[index].name);
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Navigate(
                                            title: response[index].name,
                                            image: response[index].thumbnail,
                                            slug: response[index].slug,
                                            price: response[index].price,
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
                                              child: response[index].thumbnail==null?Image.asset(
                                                                  'asset/garjoologo.png',
                                                                  height: 120,
                                                                  width: 110,
                                                                ):Image.network(
                                                  "https://api.garjoo.com" +
                                                      response[index].thumbnail,
                                                  width: 110,
                                                  height: 120)),
                                          Container(
                                            width: 50,
                                            child: Text(
                                              response[index].name,
                                              style: TextStyle(fontSize: 13),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                          Container(
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
                                                    size: 13, color: orange),
                                                SizedBox(width: 5),
                                                Center(
                                                  child: Text(
                                                    "Add to cart",
                                                    style: TextStyle(
                                                        color: orange,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))),
                            );
                        }
                            )
                            );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
      SizedBox(height: 25),
    
   
    ]);
  }
}
