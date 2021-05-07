import 'dart:convert';

class ReviewSpecific {
  final String review;
  final double rating;

  ReviewSpecific({
    this.review,
    this.rating,
  });

  factory ReviewSpecific.fromJson(Map<String, dynamic> json) => ReviewSpecific(
        review: json['review'],
        rating: json['rating'],
      );

  Map<String, dynamic> tojson() =>
      {'rating': rating.toString(), 'review': review};
}

ReviewSpecific reviewSpecificFromJson(String str) =>
    ReviewSpecific.fromJson(json.decode(str));
String reviewSpecificToJson(ReviewSpecific data) => json.encode(data.tojson());
