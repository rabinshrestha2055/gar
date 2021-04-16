import 'package:flutter/cupertino.dart';
import 'package:garjoo/models/newarivalmodel.dart';

class FeaturedProProvider extends ChangeNotifier{
static List<ArrivalModel> _productList=[
  ArrivalModel( image: 'asset/fas1.jpeg', title: '100% Organic Bo', subtitle: 'Add to Cart', ),
  ArrivalModel( image: 'asset/fas2.jpeg', title: 'Blush', subtitle: 'Add to Cart',),
  ArrivalModel( image: 'asset/fas3.jpeg', title: 'Utility Cargo', subtitle: 'Add to Cart', ),
  ArrivalModel( image: 'asset/fas1.jpeg', title: '100% Organic Bo', subtitle: 'Add to Cart', ),
  ArrivalModel( image: 'asset/fas2.jpeg', title: 'Blush', subtitle: 'Add to Cart',),
  ArrivalModel( image: 'asset/fas3.jpeg', title: 'Utility Cargo', subtitle: 'Add to Cart', ),
];
List<ArrivalModel> get getProducts => [..._productList];

}