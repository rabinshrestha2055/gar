import 'dart:convert';

class ProductModel {
  static List<Item> items;

  //Get Item by Id

  Item getById(int id) {
    return items.firstWhere(
      (element) {
        return element.id == id;
      },
      orElse: () => items.first,
    );
  }

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String slug;
  final String thumbnail;
  final String address1;
  final String address2;
  final String address;
  final num views;
  final num count;
  final String time;
  final store;
  final String description;
  final num price;
  final String title;
  final String image;
  final String name;
  final String location;
  final String label;
  final String icon;
  final int userId;
  final num rating;
  final num rate;
  final num discount;

  Item(
      {this.address1,
      this.address2,
      this.address,
      this.views,
      this.count,
      this.image,
      this.store,
      this.time,
      this.description,
      this.id,
      this.slug,
      this.name,
      this.label,
      this.icon,
      this.location,
      this.thumbnail,
      this.price,
      this.title,
      this.userId,
      this.rating,
      this.rate,
      this.discount});
  factory Item.fromJson(Map<String, dynamic> map) => Item(
      id: map['id'],
      slug: map['slug'],
      label: map['label'],
      name: map['name'],
      icon: map['icon'],
      thumbnail: map['thumbnail'],
      price: map['price'],
      rating: map['rating'],
      title: map['title'],
      image: map['path'],
      discount: map['discount'],
      location: map['location'],
      rate: map['rate'],
      userId: map['user_id'],
      address1: map['address1'],
      address2: map['address2'],
      views: map['views'],
      time: map['time'],
      count: map['count'],
      description: map['description'],
      store: map['store']);
}

List<Item> itemModelFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Item>.from(str.map((item) {
    return Item.fromJson(item);
  }));
}

List<Item> categoryItemModelFromJson(String strJson) {
  final str = json.decode(strJson);

  return List<Item>.from(str['data']['data'].map((item) {
    return Item.fromJson(item);
  }));
}

List<Item> relatedProductModelFromJson(String strJson) {
  final str = json.decode(strJson);

  return List<Item>.from(str['related'].map((item) {
    return Item.fromJson(item);
  }));
}

Item detailsModelFromJson(String strJson) {
  final jsonData = json.decode(strJson);

  var dModel = Item.fromJson(jsonData['product']);

  return dModel;
}

List<Item> visitStoreModelFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Item>.from(str['products']['data'].map((item) {
    return Item.fromJson(item);
  }));
}

List<Item> marketModelFromJson(String strJson) {
  final str = json.decode(strJson);
  final jsonData = str['categories'];
  return List<Item>.from(jsonData['children'].map((item) {
    return Item.fromJson(item);
  }));
}
