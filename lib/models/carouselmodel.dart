import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class SlideCarousel{
   final String image;
   

  SlideCarousel({@required this.image});

  factory SlideCarousel.fromJson(Map<String ,dynamic>json)=>SlideCarousel(
    image: json['path'],

  );


}
List<SlideCarousel>slidecarouselModelFromJson(String strJson){
  final jsonData =json.decode(strJson);
  return List<SlideCarousel>.from(jsonData.map((item){
    return SlideCarousel.fromJson(item);
  }));
}
