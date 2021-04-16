import 'package:flutter/material.dart';

class ViewArrivalModel{
  final String details;
  final String image;
  final String price;
  final String rating;

  ViewArrivalModel({@required this.details, @required this.image, this.price, this.rating});
}