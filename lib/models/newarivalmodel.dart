import 'dart:convert';

class ArrivalModel {
  final String image;
  final String title;
  final double discount;
  final int price;
  final String slug;
  final String rating;

  ArrivalModel({
    this.price,
    this.image,
    this.title,
    this.discount,
    this.slug,
    this.rating,
  });

  factory ArrivalModel.fromJson(Map<String, dynamic> json) => ArrivalModel(
      image: json['thumbnail'],
      title: json['title'],
      price: json['price'],
      slug: json['slug'],
      rating: json['rating'].toString());
}

List<ArrivalModel> arrivalModelFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<ArrivalModel>.from(str.map((item) {
    return ArrivalModel.fromJson(item);
  }));
}
