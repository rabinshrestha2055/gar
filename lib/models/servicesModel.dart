import 'dart:convert';

class ServiceModel{
  final String label;

  ServiceModel({this.label});

 factory ServiceModel.fromJson(Map<String, dynamic>json)=>ServiceModel(

    label: json['label'],
   
  );

}

List<ServiceModel> servicesModelFromJson(String strJson) {
  final str=json.decode(strJson);
  final jsonData=str['categories'];
  return List<ServiceModel>.from(jsonData['children'].map((item){
    
     return ServiceModel.fromJson(item);
  }));
}