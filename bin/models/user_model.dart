import 'dart:convert';

class UserModel {
  int? id;
  String? nickname;
  String? email;
  UserModel({
    this.id,
    this.nickname,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{      
      'nickname': nickname,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nickname: map['nickname'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
