import 'dart:convert';

class HotelSearchInputModel {
  HotelSearchInputModel({
    required this.fromDate,
    required this.toDate,
    required this.lastId,
    required this.limit,
    required this.cityCode,
    required this.countryCode,
    required this.timezone,
    required this.propertyType,
    required this.numberOfAdults,
    required this.numberOfChildren,
    required this.numberOfInfants,
    required this.numberOfPets,
    required this.numberOfRooms,
    required this.maxPrice,
    required this.minPrice,
    required this.currency,
    required this.ranks,
    required this.topRanking,
  });

  final int fromDate;
  final int toDate;
  final dynamic lastId;
  final int limit;
  final String cityCode;
  final String countryCode;
  final String timezone;
  final dynamic propertyType;
  final int numberOfAdults;
  final int numberOfChildren;
  final int numberOfInfants;
  final int numberOfPets;
  final int numberOfRooms;
  final int maxPrice;
  final int minPrice;
  final String currency;
  final List<dynamic> ranks;
  final bool topRanking;

  factory HotelSearchInputModel.fromRawJson(String str) => HotelSearchInputModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HotelSearchInputModel.fromJson(Map<String, dynamic> json) => HotelSearchInputModel(
    fromDate: json["from_date"],
    toDate: json["to_date"],
    lastId: json["last_id"],
    limit: json["limit"],
    cityCode: json["city_code"],
    countryCode: json["country_code"],
    timezone: json["timezone"],
    propertyType: json["property_type"],
    numberOfAdults: json["number_of_adults"],
    numberOfChildren: json["number_of_children"],
    numberOfInfants: json["number_of_infants"],
    numberOfPets: json["number_of_pets"],
    numberOfRooms: json["number_of_rooms"],
    maxPrice: json["max_price"],
    minPrice: json["min_price"],
    currency: json["currency"],
    ranks: List<dynamic>.from(json["ranks"].map((x) => x)),
    topRanking: json["top_ranking"],
  );

  Map<String, dynamic> toJson() => {
    "from_date": fromDate,
    "to_date": toDate,
    "last_id": lastId,
    "limit": limit,
    "city_code": cityCode,
    "country_code": countryCode,
    "timezone": timezone,
    "property_type": propertyType,
    "number_of_adults": numberOfAdults,
    "number_of_children": numberOfChildren,
    "number_of_infants": numberOfInfants,
    "number_of_pets": numberOfPets,
    "number_of_rooms": numberOfRooms,
    "max_price": maxPrice,
    "min_price": minPrice,
    "currency": currency,
    "ranks": List<dynamic>.from(ranks.map((x) => x)),
    "top_ranking": topRanking,
  };
}
