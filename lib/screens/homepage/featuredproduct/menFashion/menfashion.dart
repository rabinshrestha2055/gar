
import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class MenFashion extends StatefulWidget {
   MenFashion({Key key}) : super(key: key);

  @override
  _MenFashionState createState() => _MenFashionState();
}

class _MenFashionState extends State<MenFashion> {
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
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
      body: ListView(
        children: [
         Carousel1(),
          ChangeNotifierProvider<UserDetailsProvider>(
            create: (context) => UserDetailsProvider(),
            child: Consumer<UserDetailsProvider>(
                builder: (context, value, child) => FutureBuilder(
                    future: value.getMenProduct(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Container();
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        var response = snapshot.data as List<MenFashionModel>;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(
                              parent: NeverScrollableScrollPhysics()),
                          itemCount: response.length,
                          itemBuilder: (context, index) => Card(
                            elevation: 0.4,
                            child: Stack(
                              children: [
                                Container(
                                    child: Stack(children: [
                                      Image.network(
                                          "https://api.garjoo.com" +
                                              response[index].image,
                                          width: 99,
                                          height: 120),
                                   
                                SizedBox(width: 10),
                                Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 28),
                                      margin: EdgeInsets.only(right:20),
                                      child: Padding(
                                         padding:EdgeInsets.fromLTRB(110, 10, 20, 20),
                                        child: Column(
                                          
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                             
                                              response[index].title,
                                              style: TextStyle(fontSize: 14),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              
                                            ),
                                               Text(
                                      response[index].price.toString(),
                                      style: TextStyle(color: Colors.red),
                                    ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          
                        )])));
                      } else {
                        return Container();
                      }
                    })),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
