import 'dart:convert';

class TokenModel {
  TokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiredTime,
  });

  final String accessToken;
  final String refreshToken;
  final int expiredTime;

  factory TokenModel.fromRawJson(String str) => TokenModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    expiredTime: json["expired_time"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "expired_time": expiredTime,
  };
}
