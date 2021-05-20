import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;
  get getCurrentIndex => _currentIndex;
  set setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
