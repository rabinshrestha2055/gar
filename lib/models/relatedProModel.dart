import 'dart:convert';

class RelatedProModel{
  final String name;
  final String image;
  final int price;
  final String slug;
  

  RelatedProModel({ this.name, this.image, this.price,this.slug});


 factory RelatedProModel.fromJson(Map<String, dynamic>json)=>RelatedProModel(

    name: json['name'],
    image: json['thumbnail'],
    price: json['price'],
    slug: json['slug'],
  
  );

}

List<RelatedProModel> relatedProductModelFromJson(String strJson) {
  final str=json.decode(strJson);
    
  return List<RelatedProModel>.from(str['related'].map((item){
     return RelatedProModel.fromJson(item);
  }));
}
