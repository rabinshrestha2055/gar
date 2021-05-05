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
  final String phoneNumber;
  final String token;

  UserModel({
    this.confirmPassword,
    this.type,
    this.username,
    this.id,
    this.email,
    this.password,
    this.companyName,
    this.companyEmail,
    this.phoneNumber,
    this.token,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      email: json["email"],
      username: json["name"],
      password: json["password"],
      confirmPassword: json['password_confirmation'],
      phoneNumber: json['company_phone'],
      companyEmail: json['company_email'],
      companyName: json['company_name'],
      type: json['type'],
      token: json['token']);

  Map<String, dynamic> tojson() => {
        "name": username,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
        "type": type,
        "company_phone": phoneNumber.toString(),
        "company_email": companyEmail,
        "company_name": companyName,
        "token": token
      };
}

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.tojson());
