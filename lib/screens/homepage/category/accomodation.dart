import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class Accomodation extends StatelessWidget {
  const Accomodation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 8, top: 12.0),
          child: Image.asset(
            'asset/garjoologo.png',
            height: 150,
            width: 150,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(Icons.search),
              onTap: () {},
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              child: Icon(Icons.shopping_cart_outlined),
              onTap: () {},
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Recently Listed',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ChangeNotifierProvider<UserDetailsProvider>(
            create: (context) => UserDetailsProvider(),
            child: Consumer<UserDetailsProvider>(
              builder: (context, value, child) => FutureBuilder(
                future: value.getnewProperties(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    var response = snapshot.data as List<NewPropertiesModel>;
                    return Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 170,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: response.length,
                            itemBuilder: (context, index) => Container(
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
                                                    response[index].image,
                                                width: 110,
                                                height: 130)),
                                        Text(response[index].title),
                                      ],
                                    )))));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          ClassifiedAds(),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Trending Now',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ChangeNotifierProvider<UserDetailsProvider>(
            create: (context) => UserDetailsProvider(),
            child: Consumer<UserDetailsProvider>(
              builder: (context, value, child) => FutureBuilder(
                future: value.gettopListing(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    var response = snapshot.data as List<TopListingModel>;
                    return Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                            physics: ScrollPhysics(
                                parent: NeverScrollableScrollPhysics()),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 0,
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 4,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: response.length,
                            itemBuilder: (context, index) => Container(
                              height: 600,
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
                                                    response[index].image,
                                                width: 110,
                                                height: 130)),
                                        Padding(
                                          padding: EdgeInsets.only(left:12,right:12),
                                          child:Text(response[index].title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize:12),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        ),),
                                        SizedBox(height: 5),
                                        Text(
                                          response[index].price.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                            height: 25,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                color: red,
                                                borderRadius:
                                                    BorderRadius.circular(22)),
                                            child: Center(
                                                child: Text(
                                              'View Details',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )))
                                      ],
                                    )))));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
