import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:garjoo/models/categorymodel.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> _getCategory = [
    CategoryModel(
        name: 'Market',
        icon: FontAwesomeIcons.storeAlt,
        slug: 'market?',
        buttonText: 'Add to cart'),
    CategoryModel(
        name: 'Services',
        icon: FontAwesomeIcons.servicestack,
        slug: 'services?',
        buttonText: 'View Details'),
    CategoryModel(
        name: 'Jobs', icon: Icons.work, slug: 'jobs?', buttonText: 'Apply Job'),
    CategoryModel(
        name: 'Motors',
        icon: FontAwesomeIcons.car,
        slug: 'car?',
        buttonText: 'View Details'),
    CategoryModel(
        name: 'Real Estate',
        icon: FontAwesomeIcons.home,
        slug: 'real-estate?',
        buttonText: 'Buy Properties'),
    CategoryModel(
        name: 'Accomodation',
        icon: FontAwesomeIcons.hotel,
        slug: 'hotels?',
        buttonText: 'View Details'),
  ];
  List<CategoryModel> get getCat => [..._getCategory];
}
