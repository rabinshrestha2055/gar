import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/models/reviewSpecific.dart';
import 'package:garjoo/widget/loginFirst.dart';
import 'package:provider/provider.dart';

class ReviewNA extends StatefulWidget {
  final String email;

  const ReviewNA({Key key, this.email}) : super(key: key);
  @override
  _ReviewNAState createState() => _ReviewNAState();
}

class _ReviewNAState extends State<ReviewNA> {
  double rating1;
  var _question = TextEditingController();
  var _review = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: widget.email == null
            ? LoginFirst()
            : ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.speaker,
                                color: red,
                              ),
                              Text(
                                'Do you have any Questions?',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
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
                              controller: _question,
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.speaker,
                                color: red,
                              ),
                              Text(
                                'Write a Review',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
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
                              controller: _review,
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
                              padding: const EdgeInsets.only(
                                  left: 5, bottom: 8.0, top: 5),
                              child: RatingBar.builder(
                                initialRating: 1,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemSize: 18,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.red,
                                  size: 2,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    rating1 = rating;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        ChangeNotifierProvider<UserDetailsProvider>(
                          create: (context) => UserDetailsProvider(),
                          child: Consumer<UserDetailsProvider>(
                            builder: (context, value, child) => Container(
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
                                  onPressed: () {
                                    setState(() {
                                      String review = _review.toString().trim();

                                      var reviewSpecific = ReviewSpecific(
                                        review: review,
                                        rating: rating1,
                                      );
                                      value
                                          .reviewSpecific(reviewSpecific)
                                          .then((response) {
                                        if (response.statusCode == 200) {
                                          var snackBar = SnackBar(
                                              content:
                                                  Text('Review Sucessful!'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        } else {
                                          final snackbar = SnackBar(
                                            content:
                                                Text('Review Unsucessfull!'),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackbar);
                                        }
                                      });
                                    });
                                  }),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.speaker,
                            color: red,
                          ),
                          Text(
                            'Write a Review',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                                radius: 30,
                                child: Image.asset('asset/person1.png')),
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
