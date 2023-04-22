import 'dart:convert';

class UpdateUserProfileModel {
  UpdateUserProfileModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  final String firstName;
  final String lastName;
  final String phone;

  factory UpdateUserProfileModel.fromRawJson(String str) => UpdateUserProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateUserProfileModel.fromJson(Map<String, dynamic> json) => UpdateUserProfileModel(
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
  };
}
