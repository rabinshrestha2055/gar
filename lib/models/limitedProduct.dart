import 'dart:convert';

List<LimitedProductModel> limitedFromJson(String str) => List<LimitedProductModel>.from(json.decode(str).map((x) => LimitedProductModel.fromJson(x)));

class LimitedProductModel {
    LimitedProductModel({
        
        this.name,
        this.slug,
        this.description,
        this.address,
        this.profile,
        this.time,
        this.limitedProduct,
        this.website,
    });

    int id;
    int userId;
    String name;
    String slug;
    String description;
    String address;
    String profile;
    String time;
    List<LimitedProduct> limitedProduct;
    String website;

    factory LimitedProductModel.fromJson(Map<String, dynamic> json) => LimitedProductModel(
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        address: json["address"],
        profile: json["profile"],
        time: json["time"],
        limitedProduct:List<LimitedProduct>.from(json['limited_product']),
        // List<LimitedProduct>.from(json["limited_product"].map((item) => LimitedProduct.fromJson(item))),
        website: json["website"] == null ? null : json["website"],
    );

}

class LimitedProduct {
    LimitedProduct({
     
        this.location,
        this.storeId,
        this.thumbnail,
        this.views,
        this.price,
        this.slug,
        
    });

    String name;
    String location;
    int storeId;
    String thumbnail;
    int views;
    int price;
    String slug;
   

    factory LimitedProduct.fromJson(Map<String, dynamic> json) => LimitedProduct(
        location: json["location"],
        storeId: json["store_id"],
       thumbnail: json["thumbnail"],
        views: json["views"],
        price: json["price"],
        slug: json["slug"],
      
    );


}