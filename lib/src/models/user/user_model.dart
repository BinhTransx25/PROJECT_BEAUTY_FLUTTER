// import 'package:json_annotation/json_annotation.dart';

// part 'user_model.g.dart';

// @JsonSerializable()
// class UserModel {
//   final String id;
//   final String email;
//   final String token;

//   UserModel({required this.id, required this.email, required this.token});

//   factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
//   Map<String, dynamic> toJson() => _$UserModelToJson(this);
// }

class UserModel {
 
  final String name;
  final String email;
  final String password;

  UserModel({
   
    required this.name, 
    required this.email,
    required this.password
    });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password']
    );
  }
}
