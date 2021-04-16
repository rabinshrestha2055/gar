import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class DescriptionNA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 1.5,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('- Length: 73cm(size medium)'),
                        Text('- Medium fit'),
                        Text('- Pure cotton denim construction; lightweight'),
                        Text('- Light wash'),
                        Text('- Pointed collar'),
                        Text('- Twin press-stud flap pockets to chest'),
                        Text('- Short sleeve'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              SizedBox(height: 10),
              Card(
                  elevation: 1.0,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Method",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Home Delivery",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Days",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "4-6 days  ",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Cash on  Delivery",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Enjoy Free Shipping promotion with minimum 2 times'),
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              Card(
                  elevation: 1.0,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Return & Warranty",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "7 Days Return",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Enjoy Free Shipping promotion with minimum 2 times'),
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              Card(
                  elevation: 0.18,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 15.0,
                              backgroundColor: Colors.purpleAccent,
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                size: 18.0,
                              )),
                          SizedBox(width: 5),
                          Text(
                            "The Next Trends",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Products',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text('25'),
                                  ],
                                ),
                                SizedBox(width: 50),
                                Container(
                                  height: 35,
                                  width: 1,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Views',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text('9'),
                                  ],
                                ),
                                SizedBox(width: 30),
                                Container(
                                  height: 35,
                                  width: 1,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'On Garjoo',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text('3 months ago')
                              ],
                            ),
                          ]),
                      SizedBox(height: 10),
                       InkWell(
                        child: Text('Visit Store',
                            style: TextStyle(color: Colors.red)),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => VisitStore()));
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  )),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8),
                child: Text("Similar Products",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              ChangeNotifierProvider(
                create: (context) => UserDetailsProvider(),
                child: Consumer<UserDetailsProvider>(
                  builder: (context, value, child) => FutureBuilder(
                      future: value.getRelatedProduct(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          var response =
                              snapshot.data as List<RelatedProModel>;

                          return Container(
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 0,
                                  crossAxisCount: 2,
                                  childAspectRatio: 4 / 4.5,
                                ),
                                physics: ScrollPhysics(
                                    parent: NeverScrollableScrollPhysics()),
                                itemCount: 3,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {},
                                      child: Card(
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: Image.network(
                                                    "https://api.garjoo.com" +
                                                        response[index].image,
                                                    width: 97.3,
                                                    height: 120)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20.0,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  response[index].name,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Add to cart",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
