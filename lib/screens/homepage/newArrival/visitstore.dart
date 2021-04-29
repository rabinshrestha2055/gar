import 'package:flutter/material.dart';
import 'package:garjoo/models/datamodel.dart';
import 'package:provider/provider.dart';

import '../../../core.dart';

class VisitStore extends StatelessWidget {
  final String slug;
  final String storeImage;
  final String storeName;
  final String image;
  final String name;
  final String rating;
  final String storetitle;

  const VisitStore(
      {Key key,
      this.slug,
      this.image,
      this.name,
      this.storeImage,
      this.rating,
      this.storeName, this.storetitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<UserDetailsProvider>(
        create: (context) => UserDetailsProvider(),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Stack(children: [
              Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    AppURl.path + storeImage,
                    fit: BoxFit.fill,
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8, bottom: 8),
              child: Text(
                storetitle,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            ChangeNotifierProvider(
                create: (context) => UserDetailsProvider(),
                child: Consumer<UserDetailsProvider>(
                  builder: (context, value, child) => FutureBuilder(
                      future: value.getData(slug: slug),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          var response = snapshot.data as List<DataModel>;

                          return Container(
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
                                  
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>Navigate(
                             title:             response[index].name,
                                                image: response[index].image,
                                                slug: response[index].slug,
                                                price: response[index].price,
                                                rating: rating,
                          )));
                        },
                                                                  child: Container(
                                      width: 126,
                                      child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Container(
                                                  padding:
                                                      EdgeInsets.only(left: 8),
                                                  child: Stack(children: [
                                                    Image.network(
                                                        AppURl.path +
                                                            response[index].image,
                                                        width: 99,
                                                        height: 120),
                                                  ])),
                                              Text(
                                                response[index].name,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 25,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.amber)),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width: 1),
                                                          Icon(
                                                              Icons.shopping_cart,
                                                              size: 10,
                                                              color: orange),
                                                          Center(
                                                            child: Text(
                                                              "Add to cart",
                                                              style: TextStyle(
                                                                  color: orange,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          SizedBox(width: 1),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ))),
                                )),
                          );
                        } else {
                          return LinearProgressIndicator(
                            minHeight: 2,
                          );
                        }
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
