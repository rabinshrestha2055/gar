import 'dart:convert';

import 'package:flutter/material.dart';

class FeaturedCatModel {
  final String name;
  final String icon;

  FeaturedCatModel({
    this.name,
   this.icon,
  });
factory FeaturedCatModel.fromJson(Map<String, dynamic>json)=>FeaturedCatModel(
  name: json['label'], 
  icon: json['icon']);

  }
  List<FeaturedCatModel> featuredCategoryModelFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<FeaturedCatModel>.from(str.map((item){
     return FeaturedCatModel.fromJson(item);
  }));}
