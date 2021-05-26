// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<ParentCategory> categoryFromJson(String str) => List<ParentCategory>.from(
    json.decode(str).map((x) => ParentCategory.fromJson(x)));

String categoryToJson(List<ParentCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParentCategory {
  ParentCategory({
    this.id,
    this.label,
    this.childs,
  });

  int id;
  String label;
  List<Category1> childs;

  factory ParentCategory.fromJson(Map<String, dynamic> json) => ParentCategory(
        id: json["id"],
        label: json["label"],
        childs: List<Category1>.from(
            json["childs"].map((x) => Category1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lebel": label,
        "childs": List<dynamic>.from(childs.map((x) => x.toJson())),
      };
}

class Category1 {
  Category1({
    this.id,
    this.label,
    this.childs,
  });

  int id;
  String label;
  List<SubCategory> childs;

  factory Category1.fromJson(Map<String, dynamic> json) => Category1(
        id: json["id"],
        label: json["label"],
        childs: List<SubCategory>.from(
            json["childs"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "childs": List<dynamic>.from(childs.map((x) => x.toJson())),
      };
}

class SubCategory {
  SubCategory({
    this.id,
    this.label,
    this.childs,
  });

  int id;
  String label;
  List<ChildCategory> childs;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        label: json["label"],
        childs: List<ChildCategory>.from(
            json["childs"].map((x) => ChildCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "childs": List<dynamic>.from(childs.map((x) => x.toJson())),
      };
}

class ChildCategory {
  ChildCategory({
    this.id,
    this.label,
  });

  int id;
  String label;

  factory ChildCategory.fromJson(Map<String, dynamic> json) => ChildCategory(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}
