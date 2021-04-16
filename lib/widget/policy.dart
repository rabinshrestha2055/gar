  import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  
  static Future openLink({@required String url}) => _launchUrl(url);

  // static Future openPhonecall({String phoneNo}) async {
  //   final url = 'tel:$phoneNo';
  //   await _launchUrl(url);
  // }


  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}