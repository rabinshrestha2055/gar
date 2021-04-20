import 'dart:convert';

class DataModel {
  final String name;
  final String image;
  final int price;
  final String slug;

  DataModel({this.name, this.image, this.price, this.slug});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        name: json['name'],
        image: json['thumbnail'],
        price: json['price'],
        slug: json['slug'],
      );
}

List<DataModel> dataModelFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<DataModel>.from(str['products']['data'].map((item) {
    return DataModel.fromJson(item);
  }));
}
