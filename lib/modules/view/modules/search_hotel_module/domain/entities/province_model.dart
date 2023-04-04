
import 'dart:convert';

class ProvinceModel {
  ProvinceModel({
    required this.name,
    required this.code,
    required this.divisionType,
    required this.codename,
    required this.phoneCode,
    required this.districts,
  });

  final String name;
  final int code;
  final String divisionType;
  final String codename;
  final int phoneCode;
  final List<dynamic> districts;

  factory ProvinceModel.fromRawJson(String str) => ProvinceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
    name: json["name"],
    code: json["code"],
    divisionType: json["division_type"],
    codename: json["codename"],
    phoneCode: json["phone_code"],
    districts: List<dynamic>.from(json["districts"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "division_type": divisionType,
    "codename": codename,
    "phone_code": phoneCode,
    "districts": List<dynamic>.from(districts.map((x) => x)),
  };

  static List<ProvinceModel> listFromJson(list){
    List<ProvinceModel> tempList=[];
    try{
      tempList.addAll(List<ProvinceModel>.from(list.map((model)=> ProvinceModel.fromJson(model))));
      return tempList;
    }catch(e){
      return tempList;
    }
  }
}
