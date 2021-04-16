
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/models/carouselmodel.dart';

class CarouselProvider extends ChangeNotifier {

  
static List<SlideCarousel> _imageList = [

      SlideCarousel(image: 'asset/slider1.jpeg'),
      SlideCarousel(image: 'asset/slider2.jpeg'),
        SlideCarousel(image: 'asset/slider1.jpeg'),
      SlideCarousel(image: 'asset/slider2.jpeg'),
      
  ];
        List<SlideCarousel> get getCarousel => [..._imageList];
    }