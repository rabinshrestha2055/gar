import 'dart:convert';



class DiscountModel{
  final int discount;
  final String image;
  final String title;
  final String subtitle;
  final int rating;
  final int price;

  DiscountModel({
     this.discount,
      this.image,
       this.title,
      this.price,
       this.subtitle,
        this.rating});


factory DiscountModel.fromJson(Map<String, dynamic>json)=>DiscountModel(
  image: json['thumbnail'],
  title: json['title'],
  price: json['price'],
  discount: json['discount'],
  rating: json['rate']

);



}
List<DiscountModel> discountModelFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<DiscountModel>.from(str.map((item){
     return DiscountModel.fromJson(item);
  }));}