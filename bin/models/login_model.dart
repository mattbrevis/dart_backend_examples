import 'dart:convert';
class LoginModel {
  String? email;
  String? password;
  String? token;
  LoginModel({
    this.email,
    this.password,
    this.token,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'token': token,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'],
      password: map['password'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
