import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/models/quicklinkmodel.dart';

class QuickLinkProvider extends ChangeNotifier {
  List<QuickLinkModel> _getQuickLink = [
    QuickLinkModel('Market', 'asset/market.svg'),
    QuickLinkModel('Service', 'asset/service.svg'),
    QuickLinkModel('Urgent Jobs', 'asset/urgent.svg'),
    QuickLinkModel('Cars', 'asset/cars.svg'),
    QuickLinkModel('Motorbikes', 'asset/bike.svg'),
    QuickLinkModel('Real Estate  ', 'asset/realState.svg'),
    QuickLinkModel('Hotels', 'asset/hotel.svg'),
    QuickLinkModel('SmartPhone', 'asset/smartphone.svg'),
  ];

  List<QuickLinkModel> get getQuick => [..._getQuickLink];
}
