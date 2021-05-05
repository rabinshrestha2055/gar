import 'dart:convert';

class StoreBannerModel{
  final String image;
  final String type;
  final int id;

  StoreBannerModel( {this.type, this.id,this.image});
   

factory StoreBannerModel.fromJson(Map<String, dynamic>json)=>StoreBannerModel(
  image: json['path'],
  type: json['type'],
  id: json['id']
  );
}

  List<StoreBannerModel> storeBannerModelFromJson(String strJson) {
  final str=json.decode(strJson);
  print(str);
  return List<StoreBannerModel>.from(str.map((item){
     return StoreBannerModel.fromJson(item);
  }));}