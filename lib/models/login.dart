import 'dart:convert';

class UserModel {
  final String email;
  final String type;
  final String username;
  final String password;
  final String confirmPassword;
  final int id;
  final String companyName;
  final String companyEmail;
  final int phoneNumber;

  UserModel({
    this.confirmPassword,
    this.type,
    this.username,
    this.id,
    this.email,
    this.password,
    this.companyName,
    this.companyEmail,
    this.phoneNumber
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      email: json["email"],
      username: json["name"],
      password: json["password"],
      confirmPassword: json['password_confirmation'],
      type: json['type']);

  Map<String, dynamic> tojson() => {
        "id": id,
       "name": username,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
        "type": type
      };
}

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.tojson());
