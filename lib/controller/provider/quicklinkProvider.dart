import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/models/homequicklink.dart';

class QuickLinkProvider extends ChangeNotifier {
  List<HomeQuickLink> _getQuickLink = [
    HomeQuickLink('Market', 'asset/market.svg', 'market?', 'Add to cart'),
    HomeQuickLink('Service', 'asset/service.svg', 'services?', 'View Details'),
    HomeQuickLink('Urgent Jobs', 'asset/urgent.svg', 'jobs?', "Apply Job"),
    HomeQuickLink('Cars', 'asset/cars.svg', 'car?', "View Details"),
    HomeQuickLink('Motorbikes', 'asset/bike.svg', 'bike?', "View Details"),
    HomeQuickLink('Real Estate  ', 'asset/realState.svg', 'real-estate?',
        "Buy Properties"),
    HomeQuickLink('Hotels', 'asset/hotel.svg', 'hotels?', "View Details"),
    HomeQuickLink('SmartPhone', 'asset/smartphone.svg', 'mobile-accessories?',
        "Add to cart"),
  ];

  List<HomeQuickLink> get getQuick => [..._getQuickLink];
}
