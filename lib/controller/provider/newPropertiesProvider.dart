import 'package:flutter/foundation.dart';

import '../../core.dart';

class NewPropertiesProvider extends ChangeNotifier{
static List<NewPropertiesModel> viewnewPrpertiesList=[
];
List<NewPropertiesModel> get getnewProperties => [...viewnewPrpertiesList];
}