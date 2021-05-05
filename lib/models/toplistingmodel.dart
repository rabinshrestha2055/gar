import 'dart:convert';

class TopListingModel{
  final String title;
  final String image;
  final int price;

  TopListingModel({this.price,this.title, this.image});

  factory TopListingModel.fromJson(Map<String, dynamic>json)=>TopListingModel(
  image: json['thumbnail'],
  title: json['title'],
   price: json['price'],

);

}
List<TopListingModel> toplistingFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<TopListingModel>.from(str['items'].map((item){
     return TopListingModel.fromJson(item);
  }));}