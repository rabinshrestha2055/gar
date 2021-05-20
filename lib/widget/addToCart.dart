import 'package:flutter/material.dart';
import 'package:garjoo/core/store.dart';
import 'package:garjoo/models/cart_model.dart';
import 'package:garjoo/models/similar.dart';
import 'package:velocity_x/velocity_x.dart';
import '../colors.dart';

class AddToCart extends StatelessWidget {
  final Item product;
  final String title;

  const AddToCart({Key key, this.product, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(product) ?? false;
    return InkWell(
      onTap: () {
        if (!isInCart) {
          AddMutation(product);
        }
      },
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
                title == null ? "Add to cart" : title,
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
