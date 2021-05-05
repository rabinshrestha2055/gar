import 'package:flutter/material.dart';
import 'package:garjoo/controller/provider/userProvider.dart';
import 'package:garjoo/models/storeTop.dart';
import 'package:garjoo/widget/storetopbanner.dart';
import 'package:provider/provider.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => UserDetailsProvider(),
      child: Consumer<UserDetailsProvider>(
          builder: (context, value, child) => FutureBuilder(
              future: value.getStoreTop(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  var response = snapshot.data as List<StoreTopModel>;
                  // print(response);
                  return ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Expanded(
                          child: SizedBox(
                              height: 200, width: 100, child: StoreBanner()),
                        ),
                        SizedBox(height: 20),
                        Card(
                          elevation: 2,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(
                                  parent: NeverScrollableScrollPhysics()),
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  response.length > 0 ? response.length : 0,
                              itemBuilder: (context, index) {
                                return Column(children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          radius: 15.0,
                                          backgroundColor: Colors.purpleAccent,
                                          child: Icon(
                                            Icons.shopping_bag_outlined,
                                            size: 18.0,
                                          )),
                                      SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            response[index].name,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            response[index].address,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),

                                  //MyArrival()
                                ]);
                              }),
                        ),
                      ]);
                } else {
                  return LinearProgressIndicator(
                    minHeight: 2,
                  );
                }
              })),
    ));
  }
}
