
import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';


class Navigate extends StatefulWidget {
  int length;
  Navigate({this.length});

  @override
  _NavigateState createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  TabController _tabController;
  List<Widget> tabItems = [
    ProductNA(),
    DescriptionNA(), 
    ReviewNA()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              'asset/garjoologo.png',
              height: 60,
              width: 110,
            ),
          ),
          actions: [
            Stack(children: [
              Positioned(
                top: 24,
                left: 8,
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.red,
                  child: Text(
                    '10',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.shopping_cart_outlined), onPressed: () {}),
            ]),
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Center(
                child: Text(
              'JBL Headphone',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rs 49",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3, right: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.white,
                          ),
                          Text(
                            '4.9',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ],
                      ),
                    ))
              ],
            )),
            SizedBox(height: 10),
          Carousel1(),
            Container(
              
              height: MediaQuery.of(context).size.height*1.475,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 3,
                  child: Flexible(
                      child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: Container(
                            padding: EdgeInsets.only(left: 15, right: 1),
                            height: 35,
                            child: TabBar(
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.red[400],
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelPadding: EdgeInsets.all(0),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              controller: _tabController,
                              tabs: [
                                Tab(
                                  child: Text('Product',
                                      style: TextStyle(fontSize: 14)),
                                ),
                                Tab(
                                    child: Text('Description',
                                        style: TextStyle(fontSize: 14))),
                                Tab(
                                    child: Text('Reviews',
                                        style: TextStyle(fontSize: 14))),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Expanded(
                          
                            child: TabBarView(
                                controller: _tabController, children: tabItems))
                                
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left:12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                    height: 48,
                    width: 160,
                      child: Card(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             SizedBox(width:18),
                            Text('Buy Now'),
                            SizedBox(width:8),
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.arrow_upward_outlined,color: Colors.white,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                    height: 48,
                    width: 150,
                      child: Card(
                        color: Colors.red[300],
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        // margin: EdgeInsets.only(left:15,right:170),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width:10),
                            Text('ADD TO CART',style: TextStyle(fontSize:13,color:Colors.white),),
                            CircleAvatar(
                              radius: 17,
                              child: Icon(Icons.arrow_forward_ios,size: 18,color: Colors.red[300],
                            )
                            )],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        
          ],
        ));
  }
}
