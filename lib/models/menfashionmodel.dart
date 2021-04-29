import 'dart:convert';

class MenFashionModel{
  final String title;
  final String image;
  final int price;
  final String slug;
  final String rating;

  MenFashionModel( {this.price,this.rating,this.slug,this.title, this.image});


 factory MenFashionModel.fromJson(Map<String, dynamic>json)=>MenFashionModel(

    title: json['title'],
    image: json['thumbnail'],
    price: json['price'],
    slug:json['slug'],
    rating: json['rating'].toString(),
  );
}
// }
// MenFashionModel menModelFromJson(String str) => MenFashionModel.fromJson(json.decode(str));
List<MenFashionModel> menFashionModelFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<MenFashionModel>.from(str.map((item){
     return MenFashionModel.fromJson(item);
  }));
}

