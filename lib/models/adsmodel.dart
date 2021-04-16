import 'dart:convert';




class AdsModel{
   final String image;

  AdsModel({
     this.image
     });
    factory AdsModel.fromJson(Map<String ,dynamic>json)=>AdsModel(
    image: json['path'],

  );

}
List<AdsModel>adsModelFromJson(String strJson){
  final jsonData =json.decode(strJson);
  return List<AdsModel>.from(jsonData.map((item){
    return AdsModel.fromJson(item);
  }));
}
