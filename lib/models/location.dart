import 'dart:convert';

class LocationModel {
  final String location;

  LocationModel({this.location});
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      LocationModel(location: json['location']);
}

List<LocationModel> locationModelFromJson(String strJson) {
  final str = json.decode(strJson);
  print(str);
  return List<LocationModel>.from(str.map((item) {
    return LocationModel.fromJson(item);
  }));
}
