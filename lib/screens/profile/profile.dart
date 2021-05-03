import 'package:flutter/material.dart';

import '../../core.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: white,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Image.asset(
            'asset/garjoologo.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 40,
                    child: Image.asset(
                      'asset/person1.png',
                      height: 70,
                      width: 40,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Text(
                      'Jane Doe',
                      style: TextStyle(
                          color: red,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Edit()));
                      },
                      child: Container(
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black)),
                          child: Center(
                              child: Text(
                            'EDIT PROFILE',
                            style: TextStyle(
                              color: red,
                            ),
                          ))),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text(
                      'My Ads',
                      style: TextStyle(color: black),
                    ),
                    children: [
                      Divider(),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ViewAds()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('View Ads'),
                        ),
                      ),
                      Divider(),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => PostNewAds()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Post New Ads'),
                        ),
                      )
                    ],
                  ),
                  //Divider(),
                  ExpansionTile(
                    title: Text(
                      'Orders And Booking',
                      style: TextStyle(color: black),
                    ),
                    children: [
                      Divider(),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HotelBook()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hotel Booking'),
                        ),
                      ),
                      Divider(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ProductsOrder()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Product Orders'),
                        ),
                      )
                    ],
                  ),
                  // Divider(),
                  // ExpansionTile(
                  //   title: Text(
                  //     'Two Factor Authentication',
                  //     style: TextStyle(color: black),
                  //   ),
                  //   children: [
                  //     Divider(),
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(context, MaterialPageRoute(builder: (_)=>Enable()));
                  //       },
                  //                             child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Text('Enable 2FA'),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            margin: EdgeInsets.only(left: 70, right: 70),
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.red,
                child: Text(
                  'Login',
                  style: TextStyle(color: white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                }),
          )
        ],
      ),
    );
  }
}
