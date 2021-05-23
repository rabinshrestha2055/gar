import 'dart:convert';

class ReviewPost {
  var category;
  var subCategory;
  var quality;
  var design;
  var productname;
  var productbrand;
  var place;
  var duration;
  var price;
  var delivery;
  var like;
  var dislike;
  var date;

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

String reviewPostToJson(ReviewPost data) => json.encode(data.tojson());
