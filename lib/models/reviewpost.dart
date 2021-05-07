import 'dart:convert';

class ReviewPost {
  final String category;
  final String subCategory;
  final int quality;
  final int design;
  final String productname;
  final String productbrand;
  final String place;
  final int duration;
  final int price;
  final int delivery;
  final String like;
  final String dislike;
  final int date;

  ReviewPost(
      {this.category,
      this.subCategory,
      this.quality,
      this.design,
      this.productname,
      this.productbrand,
      this.place,
      this.duration,
      this.price,
      this.delivery,
      this.like,
      this.dislike,
      this.date});

  factory ReviewPost.fromJson(Map<String, dynamic> json) => ReviewPost(
      quality: json['quality'],
      design: json['design'],
      price: json['price'],
      delivery: json['delivery'],
      productname: json['product_name'],
      productbrand: json['product_brand'],
      place: json['place_of_purchase'],
      date: json['date_of_purchase']);

  Map<String, dynamic> tojson() => {
        "quality": quality.toString(),
        "design": design.toString(),
        "price": price.toString(),
        "delivery": delivery.toString(),
        'product_name': productname,
        "product_brand": productbrand,
        "place_of_purchase": place,
        "date_of_purchase": date
      };
}

ReviewPost reviewPostFromJson(String str) =>
    ReviewPost.fromJson(json.decode(str));
String reviewPostToJson(ReviewPost data) => json.encode(data.tojson());
