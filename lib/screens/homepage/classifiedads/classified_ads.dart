import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class ClassifiedAds extends StatelessWidget {
  const ClassifiedAds({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserDetailsProvider(),
      child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child:
              Consumer<UserDetailsProvider>(builder: (context, value, child) {
            return FutureBuilder(
                future: value.classifiedCarousel(),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Carousel(
                                  boxFit: BoxFit.fill,
                                  images: response
                                      .map((e) =>
                                          NetworkImage(AppURl.path + e.image))
                                      .toList(),
                                  dotBgColor: Colors.transparent,
                                  autoplay: true,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  dotSize: 5.0,
                                  indicatorBgPadding: 2.0,
                                ),
                              ))
                        ]);
                  } else {
                    return Container();
                  }
                });
          })),
    );
  }
}
