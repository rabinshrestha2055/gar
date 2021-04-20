import 'dart:convert';

class DetailsModel{
  final String name;
  final String image;
  final int price;
  final String slug;
  final double discount;
   final String pAddress;
  final String sAddress;
  final String location;
  final String storeslug;

  DetailsModel({this.storeslug,this.pAddress, this.sAddress, this.location,this.name, this.image, this.price,this.slug,this.discount});


 factory DetailsModel.fromJson(Map<String, dynamic>json)=>DetailsModel(

    // name: json['name'],
    // image: json['thumbnail'],
    // price: json['price'],
    slug: json['product']['slug'],
    // discount:json['discount'],
    pAddress:json['product']['address1'],
    sAddress:json['product']['address2'],
    location:json['product']['location'],
    storeslug:json['product']['store']['slug'],
  );

}

DetailsModel detailsProductModelFromJson(String strJson) {
  final  jsonData=json.decode(strJson);
  
  var dModel=DetailsModel.fromJson(jsonData);

  return dModel;
}
