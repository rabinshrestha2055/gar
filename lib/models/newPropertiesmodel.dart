import 'dart:convert';

class NewPropertiesModel{
  final String title;
  final String image;
  

NewPropertiesModel( {this.title, this.image});

  factory NewPropertiesModel.fromJson(Map<String, dynamic>json)=>NewPropertiesModel(
  image: json['thumbnail'],
  title: json['title'],
 
 

);

}
List<NewPropertiesModel> newPropertiesFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<NewPropertiesModel>.from(str.map((item){
     return NewPropertiesModel.fromJson(item);
  }));}