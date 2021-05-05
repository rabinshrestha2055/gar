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
  final String address;
  final int views;
  final String time;
  final int count;
  final String storeName;
  final String storeImage;
  final String description;

  DetailsModel(  {this.views,this.description,this.count,this.time,this.storeName, this.storeImage,this.storeslug,this.address,this.pAddress, this.sAddress, this.location,this.name, this.image, this.price,this.slug,this.discount});


 factory DetailsModel.fromJson(Map<String, dynamic>json)=>DetailsModel(

    // name: json['name'],
    // image: json['thumbnail'],
    // price: json['price'],
    slug: json['product']['slug'],
    // discount:json['discount'],
    pAddress:json['product']['address1'].toString(),
    sAddress:json['product']['address2'].toString(),
    location:json['product']['location'].toString(),
    storeslug:json['product']['store']['slug'],
    address: json['product']['address'],
    views: json['product']['views'],
    time: json['product']['time'],
    count: json['product']['count'],
    storeName: json['product']['store']['name'],
    storeImage: json['product']['store']['profile'],
    description: json['product']['description'],

  );

}

DetailsModel detailsProductModelFromJson(String strJson) {
  final  jsonData=json.decode(strJson);
  
  var dModel=DetailsModel.fromJson(jsonData);

  return dModel;
}
