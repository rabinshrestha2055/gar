import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/homepage/featuredproduct/viewFeatureList.dart';
import 'package:garjoo/widget/customAppBar.dart';

class ViewFeature extends StatefulWidget {
  final ValueSetter<dynamic> valueSetter;

  var email;
  var userName;
  ViewFeature({Key key, this.email, this.userName, this.valueSetter})
      : super(key: key);

  @override
  _ViewFeatureState createState() => _ViewFeatureState();
}

class _ViewFeatureState extends State<ViewFeature> {
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        email: widget.email,
        userName: widget.userName,
      ),
      body: ViewFeatureList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          return showDialog(
            context: context,
            builder: (ctx) => Filter(),
          );
        },
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
