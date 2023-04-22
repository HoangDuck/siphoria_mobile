
import 'dart:convert';

class UserProfileModel {
  UserProfileModel({
    required this.id,
    required this.avatar,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.phone,
    required this.gender,
    required this.role,
    required this.status,
    required this.userKeyFirebase,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String avatar;
  final String email;
  final String firstName;
  final String lastName;
  final String fullName;
  final String phone;
  final bool gender;
  final String role;
  final int status;
  final String userKeyFirebase;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory UserProfileModel.fromRawJson(String str) => UserProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    id: json["id"],
    avatar: json["avatar"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    fullName: json["full_name"],
    phone: json["phone"],
    gender: json["gender"],
    role: json["role"],
    status: json["status"],
    userKeyFirebase: json["user_key_firebase"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "full_name": fullName,
    "phone": phone,
    "gender": gender,
    "role": role,
    "status": status,
    "user_key_firebase": userKeyFirebase,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
