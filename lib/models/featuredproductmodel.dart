import 'dart:convert';



class FeaturedProductModel{
 
  final String image;
  final String title;
  final String subtitle;
  final int price;
 

  FeaturedProductModel({
      this.price,
      this.image,
    this.title,
       this.subtitle,
        });


factory FeaturedProductModel.fromJson(Map<String, dynamic>json)=>FeaturedProductModel(
    image: json['thumbnail'],
     title: json['title'], 
        price: json['price'],
        subtitle: json['slug']
);

}
List<FeaturedProductModel> featuredProductModelFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<FeaturedProductModel>.from(str.map((item){
     return FeaturedProductModel.fromJson(item);
  }));
}