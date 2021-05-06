import 'dart:convert';

class QuickLinkModel {
  final String image;
  final String slug;
  final String location;
  final int price;
  final String title;
  final String rating;

  QuickLinkModel(
      {this.slug,
      this.image,
      this.location,
      this.price,
      this.title,
      this.rating});

  factory QuickLinkModel.fromJson(Map<String, dynamic> json) => QuickLinkModel(
      image: json['thumbnail'],
      title: json['title'],
      price: json['price'],
      slug: json['slug'],
      location: json['location'],
      rating: json['rating'].toString());
}

List<QuickLinkModel> quicklinkFromJson(String strJson) {
  final str = json.decode(strJson);
  final jsonData = str['data']['data'];
  if (jsonData.isEmpty) {
    return List<QuickLinkModel>.filled(
        1,
        QuickLinkModel(
            slug: 'garjoo not available',
            title:
                'Preview not available at the moment. Please come back later.'));
  } else {
    return List<QuickLinkModel>.from(jsonData.map((item) {
      return QuickLinkModel.fromJson(item);
    }));
  }
}
