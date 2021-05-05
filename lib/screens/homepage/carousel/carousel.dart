import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';

import '../../../controller/provider/userProvider.dart';
import '../../../core.dart';

class Carousel1 extends StatefulWidget {
  const Carousel1({Key key}) : super(key: key);

  @override
  _Carousel1State createState() => _Carousel1State();
}

class _Carousel1State extends State<Carousel1> {
  Future myCarousel;
  UserDetailsProvider user = UserDetailsProvider();
  @override
  void initState() {
    myCarousel = user.homeCarousel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Card(
            borderOnForeground: true,
            child: FutureBuilder(
                future: myCarousel,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    var response = snapshot.data as List<SlideCarousel>;
                    return Container(
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
                    );
                  } else {
                    return LinearProgressIndicator(
                      minHeight: 2,
                    );
                  }
                })));
  }
}
