import 'package:flutter/material.dart';

import 'package:garjoo/models/similar.dart';
import '../colors.dart';

class ViewDetails extends StatelessWidget {
  final Item product;
  final String title;

  const ViewDetails({Key key, this.product, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 22,
        width: 88,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.amber)),
        child: Row(
          children: [
            SizedBox(width: 5),
            Icon(Icons.shopping_cart, size: 11, color: orange),
            SizedBox(width: 5),
            Center(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: orange, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
