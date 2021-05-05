import 'dart:convert';

class WomenFashionModel{
  final String title;
  final String image;
  final int price;
  final String slug;
  final String rating;

  WomenFashionModel({this.rating,this.slug,this.price,this.title, this.image});


 factory WomenFashionModel.fromJson(Map<String, dynamic>json)=>WomenFashionModel(

    title: json['title'],
    image: json['thumbnail'],
    price: json['price'],
    slug: json['slug'] ,
    rating: json['rating'].toString()
  );
}

List<WomenFashionModel> womenFashionModelFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<WomenFashionModel>.from(str.map((item){
     return WomenFashionModel.fromJson(item);
  }));
}