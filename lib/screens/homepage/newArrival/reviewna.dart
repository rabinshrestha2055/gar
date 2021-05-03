import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:garjoo/core.dart';

class ReviewNA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: MediaQuery.of(context).size.height * 1.5,
            //     child: ListView(
            //       scrollDirection: Axis.vertical,
            //       shrinkWrap: true,
            //       physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            //       children: [

            //         SizedBox(height: 30),
            //        Container(

            //          child: Column(
            //            children: [
            //              Center(child: Text('You need to login for review',style: TextStyle(fontSize: 18),)),
            //              SizedBox(height:30),
            //              MaterialButton(onPressed: (){
            //                Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
            //              },
            //               shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(20)),
            //                   color: Colors.red[300],
            //                   child: Text(
            //                     'Login',
            //                     style: TextStyle(
            //                         color: Colors.white, fontWeight: FontWeight.bold),
            //                   ),
            //              ),
            //               SizedBox(height:30),
            //              Container(
            //       margin: EdgeInsets.only(left:60),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           Text("Don't have an account? ",style: TextStyle(fontSize: 12),),
            //           InkWell(
            //             child: Text(
            //               'Create a new account.',
            //               style: TextStyle(fontSize:12,color: Colors.red),
            //             ),
            //             onTap: () {
            //               Navigator.pushReplacement(
            //                 context,
            //                 MaterialPageRoute(builder: (context) => SignUp()),
            //               );
            //             },
            //           )
            //         ],
            //       ),
            //     ),

            //            ],
            //          ),
            //        ),
            //       ],
            //     ),
            //   ),
            // ),
            Column(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Icon(
                      Icons.speaker,
                      color: red,
                    ),
                    Text(
                      'Do you have any Questions?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ]),
                  SizedBox(height: 8),
                  Container(
                      width: 350,
                      height: 60,
                      margin: EdgeInsets.only(left: 5, right: 10),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: 'Drop your question here',
                            hintStyle: TextStyle(color: Colors.grey)),
                      )),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Icon(
                      Icons.speaker,
                      color: red,
                    ),
                    Text(
                      'Write a Review',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ]),
                  SizedBox(height: 6),
                  Container(
                      width: 350,
                      height: 60,
                      margin: EdgeInsets.only(left: 5, right: 10),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: 'Write a review here',
                            hintStyle: TextStyle(color: Colors.grey)),
                      )),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          'Rating',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 5, bottom: 8.0, top: 5),
                        child: RatingBar.builder(
                          initialRating: 1,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 18,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 2,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 25,
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.red,
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {}),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(left: 2),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(
                  Icons.speaker,
                  color: red,
                ),
                Text(
                  'Write a Review',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ]),
            ),
            Card(
                child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          radius: 30, child: Image.asset('asset/person1.png')),
                      SizedBox(width: 5),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 250,
                                child: Text(
                                  'Self managing a portfolio of both purchased debth and merchantile debt cases',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, bottom: 8.0, top: 5),
                              child: RatingBar.builder(
                                initialRating: 1,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 18,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.red,
                                  size: 2,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ),
                          ])
                    ]),
              ),
            ))
          ],
        ));
  }
}
