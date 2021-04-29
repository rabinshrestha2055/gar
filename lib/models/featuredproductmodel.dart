import 'dart:convert';



class FeaturedProductModel{
 
  final String image;
  final String title;
  final String rating;
  final int price;
  final String slug;
 

  FeaturedProductModel({
    this.slug,
      this.price,
      this.image,
    this.title,
    this.rating,
      
        });


factory FeaturedProductModel.fromJson(Map<String, dynamic>json)=>FeaturedProductModel(
    image: json['thumbnail'],
     title: json['title'], 
        price: json['price'],
        slug: json['slug'],
        rating: json['rating'].toString(),
);

}
List<FeaturedProductModel> featuredProductModelFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<FeaturedProductModel>.from(str.map((item){
     return FeaturedProductModel.fromJson(item);
  }));
}