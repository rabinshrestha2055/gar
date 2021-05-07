import 'dart:convert';

class LoginUserModel {
  final String email;
  final String type;
  final String username;
  final String password;
  final String confirmPassword;
  final int id;
  final String token;
  final String companyName;
  final String companyEmail;
  final String phoneNumber;

  LoginUserModel(
      {this.confirmPassword,
      this.type,
      this.username,
      this.id,
      this.token,
      this.email,
      this.password,
      this.companyName,
      this.companyEmail,
      this.phoneNumber});
  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
      id: json['user']["id"],
      email: json['user']["email"],
      username: json['user']["name"],
      password: json["password"],
      confirmPassword: json['password_confirmation'],
      phoneNumber: json['user']['company_phone'],
      companyEmail: json['user']['company_email'],
      companyName: json['user']['company_name'],
      type: json['user']['type']);

  Map<String, dynamic> tojson() => {
        'email': email,
      };
}

LoginUserModel loginUserModelFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));
String loginUserModelToJson(LoginUserModel data) => json.encode(data.tojson());
