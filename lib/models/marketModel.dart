import 'dart:convert';

class MarketModel{
  final String label;
  final int id;

  MarketModel({this.id, this.label});

 factory MarketModel.fromJson(Map<String, dynamic>json)=>MarketModel(

    label: json['label'],
    id: json['id']
   
  );

}

List<MarketModel> marketModelFromJson(String strJson) {
  final str=json.decode(strJson);
  final jsonData=str['categories'];
  return List<MarketModel>.from(jsonData['children'].map((item){
     return MarketModel.fromJson(item);

  }));
}