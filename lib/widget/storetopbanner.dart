import 'package:flutter/material.dart';
import 'package:garjoo/controller/provider/providers.dart';
import 'package:garjoo/controller/provider/userProvider.dart';
import 'package:garjoo/models/storeBanner.dart';
import 'package:provider/provider.dart';

class StoreBanner extends StatefulWidget {
  @override
  _StoreBannerState createState() => _StoreBannerState();
}

class _StoreBannerState extends State<StoreBanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => UserDetailsProvider(),
      child: Consumer<UserDetailsProvider>(
          builder: (context, value, child) => FutureBuilder(
              future: value.getBanner(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  var response = snapshot.data as List<StoreBannerModel>;
                  print(response);
                  return ListView.builder(
                      shrinkWrap: true,
                      physics:
                          ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 220,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                                "https://api.garjoo.com" +
                                    response[index].image,
                                fit: BoxFit.fill));
                      });
                } else {
                  return LinearProgressIndicator(
                    minHeight: 2,
                  );
                }
              })),
    ));
  }
}
