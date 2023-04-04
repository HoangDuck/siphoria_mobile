import 'dart:convert';

class AccountModel {
  AccountModel({
    required this.typename,
    required this.avatar,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.rank,
    required this.referredByCode,
    required this.setting,
  });

  final String typename;
  final String avatar;
  final String email;
  final String firstName;
  final String lastName;
  final Rank rank;
  final dynamic referredByCode;
  final Setting setting;

  factory AccountModel.fromRawJson(String str) => AccountModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    typename: json["__typename"],
    avatar: json["avatar"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    rank: Rank.fromJson(json["rank"]),
    referredByCode: json["referred_by_code"],
    setting: Setting.fromJson(json["setting"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "avatar": avatar,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "rank": rank.toJson(),
    "referred_by_code": referredByCode,
    "setting": setting.toJson(),
  };
}

class Rank {
  Rank({
    required this.typename,
    required this.beginTime,
    required this.expiredTime,
    required this.insertedAt,
    required this.membershipId,
    required this.rank,
  });

  final String typename;
  final int beginTime;
  final dynamic expiredTime;
  final int insertedAt;
  final String membershipId;
  final String rank;

  factory Rank.fromRawJson(String str) => Rank.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
    typename: json["__typename"],
    beginTime: json["begin_time"],
    expiredTime: json["expired_time"],
    insertedAt: json["inserted_at"],
    membershipId: json["membership_id"],
    rank: json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "begin_time": beginTime,
    "expired_time": expiredTime,
    "inserted_at": insertedAt,
    "membership_id": membershipId,
    "rank": rank,
  };
}

class Setting {
  Setting({
    required this.typename,
    required this.countryCallingCode,
    required this.locale,
    required this.nationalPhoneNumber,
  });

  final String typename;
  final dynamic countryCallingCode;
  final String locale;
  final dynamic nationalPhoneNumber;

  factory Setting.fromRawJson(String str) => Setting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
    typename: json["__typename"],
    countryCallingCode: json["country_calling_code"],
    locale: json["locale"],
    nationalPhoneNumber: json["national_phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "country_calling_code": countryCallingCode,
    "locale": locale,
    "national_phone_number": nationalPhoneNumber,
  };
}
