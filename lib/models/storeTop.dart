import 'dart:convert';

class StoreTopModel {
  final String name;
  final String slug;
  final String address;
  final String profile;
  final String time;
  final String website;

  StoreTopModel(
      {
      this.name,
      this.slug,
      this.address,
      this.profile,
      this.time,
      this.website});

  factory StoreTopModel.fromJson(Map<String, dynamic> json) => StoreTopModel(
        name: json['name'],
        slug: json['slug'],
        address: json['address'],
        profile: json['profile'],
        time: json['time'],
        website: json['website'],
      );
}

List<StoreTopModel> storeTopModelFromJson(String strJson) {
  final str = json.decode(strJson);
  
  return List<StoreTopModel>.from(str.map((item) {
    return StoreTopModel.fromJson(item);
  }));
}
