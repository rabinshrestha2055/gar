import 'dart:convert';

class ReviewSpecific {
  final String review;
  final double rating;
  final int reviewableId;
  final String type;
  final int userId;

  ReviewSpecific({
    this.reviewableId,
    this.type,
    this.userId,
    this.review,
    this.rating,
  });

  Map<String, dynamic> tojson() => {
        'rating': rating,
        'review': review,
        'reviewable_id': reviewableId,
        'type': type,
        'user_id': userId
      };
}

String reviewSpecificToJson(ReviewSpecific data) => json.encode(data.tojson());
