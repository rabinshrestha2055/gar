import 'dart:convert';



class FeaturedCatModel {
  final String name;
  final String icon;
  final String slug;
  

  FeaturedCatModel({
    this.slug,
    this.name,
   this.icon,
  });
factory FeaturedCatModel.fromJson(Map<String, dynamic>json)=>FeaturedCatModel(
  name: json['label'], 
  icon: json['icon'],
  slug: json['slug']
  );

  }
  List<FeaturedCatModel> featuredCategoryModelFromJson(String strJson) {
  final str=json.decode(strJson);
  return List<FeaturedCatModel>.from(str.map((item){
     return FeaturedCatModel.fromJson(item);
  }));}
