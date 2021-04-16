import 'dart:convert';

class ArrivalModel{
 
  final String image;
  final String title;
  final String subtitle;
  final int price;
 

  ArrivalModel( {
     this.price,
      this.image,
       this.title,
        this.subtitle,
        });

     factory ArrivalModel.fromJson(Map<String, dynamic>json)=> ArrivalModel(
       image: json['thumbnail'],
        title: json['title'], 
        price: json['price'],
        subtitle: json['slug']
        )
        ;


}
List<ArrivalModel> arrivalModelFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<ArrivalModel>.from(str.map((item){
     return ArrivalModel.fromJson(item);
  }));
}