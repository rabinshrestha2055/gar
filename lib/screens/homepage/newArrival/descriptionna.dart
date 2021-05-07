import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DescriptionNA extends StatelessWidget {
  final String description;

  const DescriptionNA({Key key, this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
        //  Scaffold(
        //   resizeToAvoidBottomInset: false,
        //   body: Container(
        //     padding: const EdgeInsets.all(8.0),
        //     height: MediaQuery.of(context).size.height * 1.0,
        //     child:
        ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Html(data: description),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
    //   ),
    // );
  }
}
