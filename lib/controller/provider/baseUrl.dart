import 'package:flutter/foundation.dart';

class BaseURl {
  static get baseUrl {
    if (kReleaseMode) {
      return "https://api.garjoo.com/api/";
    } else {
      return "https://api.garjoo.com/api/";
    }
  }
}
