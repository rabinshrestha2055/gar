import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:garjoo/models/categorymodel.dart';

class CategoryProvider extends ChangeNotifier {

  

  List<CategoryModel> _getCategory = [
      
        CategoryModel(name: 'Market', icon:FontAwesomeIcons.storeAlt,slug: 'market?'),
        CategoryModel(name: 'Sevices', icon:FontAwesomeIcons.servicestack,slug: 'services?'),
        CategoryModel(name: 'Jobs', icon:Icons.work,slug: 'jobs?'),
        CategoryModel(name: 'Motors', icon:FontAwesomeIcons.car,slug: 'car?'),
        CategoryModel(name: 'Real Estate', icon:FontAwesomeIcons.home,slug: 'real-estate?'),
         CategoryModel(name: 'Accomodation', icon:FontAwesomeIcons.hotel,slug: 'hotels?'),
      ];
        List<CategoryModel> get getCat => [..._getCategory];
    }
  
  
