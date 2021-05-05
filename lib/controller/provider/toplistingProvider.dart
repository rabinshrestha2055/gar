import 'package:flutter/foundation.dart';

import '../../core.dart';

class TopListingProvider extends ChangeNotifier{
static List<TopListingModel> viewtoplistingList=[
];
List<TopListingModel> get gettoplisting => [...viewtoplistingList];
}