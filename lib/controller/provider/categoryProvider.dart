import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/models/categorymodel.dart';

class CategoryProvider extends ChangeNotifier {

  

  List<CategoryModel> _getCategory = [
      
        CategoryModel(name: 'Market', icon:Icons.shopping_bag),
        CategoryModel(name: 'Sevices', icon:Icons.shopping_bag),
        CategoryModel(name: 'Jobs', icon:Icons.shopping_bag),
        CategoryModel(name: 'Motors', icon:Icons.shopping_cart_outlined),
        CategoryModel(name: 'Real Estate', icon:Icons.shopping_cart_outlined),
         CategoryModel(name: 'Accomodation', icon:Icons.shopping_cart_outlined),
      ];
        List<CategoryModel> get getCat => [..._getCategory];
    }
  
  
