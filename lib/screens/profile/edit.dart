import 'package:flutter/material.dart';

import '../../core.dart';

class Edit extends StatelessWidget {
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
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top:8.0,left: 18,bottom: 8),
            child: Text('Edit Profile',style: TextStyle(fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: 'Full Name')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: 'Email')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: 'New Password')),
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => Edit()));
            },
            child: Container(
                height: 40,
                margin: EdgeInsets.only(left: 70, right: 70),
                decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: Text(
                  'Update   Profile',
                  style: TextStyle(
                    color: white,
                  ),
                ))),
          ), SizedBox(height: 20),
          Container(
            
            margin: EdgeInsets.all(20),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 InkWell(
                  onTap: () {
                  
                  },
                  child: Container(
                      height: 40,
                     width: 100,
                      decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      child: Center(
                          child: Text(
                        'Deactivate',
                        style: TextStyle(
                          color: white,
                        ),
                      ))),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => Edit()));
                  },
                  child: Container(
                      height: 40,
                     width: 120,
                      decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(12),
                         ),
                      child: Center(
                          child: Text(
                        'Pause Account',
                        style: TextStyle(
                          color: white,
                        ),
                      ))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
