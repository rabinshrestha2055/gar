import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/models/similar.dart';
import 'package:provider/provider.dart';

class Carousel1 extends StatelessWidget {
  const Carousel1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserDetailsProvider(),
      child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Card(
              borderOnForeground: true,
              child: Consumer<UserDetailsProvider>(
                  builder: (context, value, child) {
                return FutureBuilder(
                    future: value.homeCarousel(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        var response = snapshot.data as List<Item>;
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
                    });
              }))),
    );
  }
}
