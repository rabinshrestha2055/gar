import 'dart:convert';

class RelatedProModel{
  final String name;
  final String image;
  final int price;

  RelatedProModel({this.name, this.image, this.price});


 factory RelatedProModel.fromJson(Map<String, dynamic>json)=>RelatedProModel(

    name: json['name'],
    image: json['thumbnail'],
    price: json['price']
  );

}

List<RelatedProModel> reletedProductModelFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<RelatedProModel>.from(str['related'].map((item){
     return RelatedProModel.fromJson(item);
  }));
}
