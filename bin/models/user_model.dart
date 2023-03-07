// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  int? id;
  String? nickname;
  String? email;
  String? password;
  UserModel({
    this.id,
    this.nickname,
    this.email,
    this.password
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nickname': nickname,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nickname: map['nickname'],
      email: map['email'] ,
      password: map['password'],
    );
  }

  static List<UserModel> listFromMap(List<dynamic> list) => list.map((e) => UserModel.fromMap(e)).toList();

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
