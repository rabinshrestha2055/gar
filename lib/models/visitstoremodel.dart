import 'dart:convert';

class StoreModel{
  final String name;
  final String image;
  final String slug;
  

  StoreModel({this.name, this.image, this.slug});


 factory StoreModel.fromJson(Map<String, dynamic>json)=>StoreModel(

 
    image: json['store']['profile'],
    name: json['store']['name'],
    slug: json['store']['slug'],

    
   
    
  );

}

StoreModel storeModelFromJson(String strJson) {
  final  jsonData=json.decode(strJson);
  
  var dModel=StoreModel.fromJson(jsonData);
 
  return dModel;
}
