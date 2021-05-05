import 'package:flutter/foundation.dart';
import 'package:garjoo/models/view_arrival_model.dart';

class ViewArrivalProvider extends ChangeNotifier{
static List<ViewArrivalModel> viewarrivalList=[
];
List<ViewArrivalModel> get getview => [...viewarrivalList];
}