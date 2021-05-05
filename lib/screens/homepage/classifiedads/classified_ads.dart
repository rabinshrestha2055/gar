import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';

import '../../../core.dart';
import '../../../core.dart';

class ClassifiedAds extends StatefulWidget {
  const ClassifiedAds({Key key}) : super(key: key);

  @override
  _ClassifiedAdsState createState() => _ClassifiedAdsState();
}

class _ClassifiedAdsState extends State<ClassifiedAds> {
  Future classifiedCarousel;
  UserDetailsProvider user = UserDetailsProvider();
  @override
  void initState() {
    classifiedCarousel = user.classifiedCarousel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: FutureBuilder(
          future: classifiedCarousel,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              var response = snapshot.data as List<AdsModel>;

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Text(
                        'Classified Featured Ads',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5),
                    Card(
                        borderOnForeground: true,
                        child: Container(
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Carousel(
                            boxFit: BoxFit.fill,
                            images: response
                                .map((e) => NetworkImage(AppURl.path + e.image))
                                .toList(),
                            dotBgColor: Colors.transparent,
                            autoplay: true,
                            animationDuration: Duration(milliseconds: 1000),
                            dotSize: 5.0,
                            indicatorBgPadding: 2.0,
                          ),
                        ))
                  ]);
            } else {
              return Container();
            }
          }),
    );
  }
}
