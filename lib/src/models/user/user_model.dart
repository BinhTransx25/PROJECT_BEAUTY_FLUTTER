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
 
  final bool status;
  final String token;
  final String userId;
  final String name;
  final String email;
  final String role;
  final String phone;

  UserModel({
   
    required this.status,
    required this.token,
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
    required this.phone,
    });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
     status: json['status'],
      token: data['token'],
      userId: data['_id'],
      name: data['name'],
      email: data['email'],
      role: data['role'],
      phone: data['phone'],
    );
  }
}
