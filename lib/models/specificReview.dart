import 'dart:convert';

class SpecificReview1 {
  final String name;
  final String review;

  SpecificReview1({
    this.name,
    this.review,
  });

  factory SpecificReview1.fromJson(Map<String, dynamic> json) =>
      SpecificReview1(
        name: json['name'],
        review: json['review'],
      );
}

List<SpecificReview1> sReviewModelFromJson(String strJson) {
  final str = json.decode(strJson);

  return List<SpecificReview1>.from(str.map((item) {
    return SpecificReview1.fromJson(item);
  }));
}
