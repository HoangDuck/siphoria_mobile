
import 'dart:convert';

class HotelSearchModel {
  HotelSearchModel({
    required this.typename,
    required this.availableAt,
    required this.availableAtDate,
    required this.currency,
    required this.id,
    required this.price,
    required this.property,
  });

  final String typename;
  final int availableAt;
  final DateTime availableAtDate;
  final String currency;
  final String id;
  final int price;
  final Property property;

  factory HotelSearchModel.fromRawJson(String str) => HotelSearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HotelSearchModel.fromJson(Map<String, dynamic> json) => HotelSearchModel(
    typename: json["__typename"],
    availableAt: json["available_at"],
    availableAtDate: DateTime.parse(json["available_at_date"]),
    currency: json["currency"],
    id: json["id"],
    price: json["price"],
    property: Property.fromJson(json["property"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "available_at": availableAt,
    "available_at_date": "${availableAtDate.year.toString().padLeft(4, '0')}-${availableAtDate.month.toString().padLeft(2, '0')}-${availableAtDate.day.toString().padLeft(2, '0')}",
    "currency": currency,
    "id": id,
    "price": price,
    "property": property.toJson(),
  };
}

class Property {
  Property({
    required this.typename,
    required this.address,
    required this.id,
    required this.info,
    required this.name,
    required this.overview,
    required this.photos,
    required this.rating,
    required this.roomTypes,
  });

  final String typename;
  final Address address;
  final String id;
  final Info info;
  final String name;
  final String overview;
  final List<Photo> photos;
  final int rating;
  final List<RoomType> roomTypes;

  factory Property.fromRawJson(String str) => Property.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    typename: json["__typename"],
    address: Address.fromJson(json["address"]),
    id: json["id"],
    info: Info.fromJson(json["info"]),
    name: json["name"],
    overview: json["overview"],
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    rating: json["rating"],
    roomTypes: List<RoomType>.from(json["room_types"].map((x) => RoomType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "address": address.toJson(),
    "id": id,
    "info": info.toJson(),
    "name": name,
    "overview": overview,
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "rating": rating,
    "room_types": List<dynamic>.from(roomTypes.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    required this.typename,
    required this.cityCode,
    required this.rawAddress,
  });

  final String typename;
  final String cityCode;
  final String rawAddress;

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    typename: json["__typename"],
    cityCode: json["city_code"],
    rawAddress: json["raw_address"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "city_code": cityCode,
    "raw_address": rawAddress,
  };
}

class Info {
  Info({
    required this.typename,
    required this.tripadvisor,
  });

  final String typename;
  final Tripadvisor tripadvisor;

  factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    typename: json["__typename"],
    tripadvisor: Tripadvisor.fromJson(json["tripadvisor"]),
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "tripadvisor": tripadvisor.toJson(),
  };
}

class Tripadvisor {
  Tripadvisor({
    required this.rating,
    required this.review,
    required this.url,
  });

  final int rating;
  final int review;
  final String url;

  factory Tripadvisor.fromRawJson(String str) => Tripadvisor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tripadvisor.fromJson(Map<String, dynamic> json) => Tripadvisor(
    rating: json["rating"],
    review: json["review"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "review": review,
    "url": url,
  };
}

class Photo {
  Photo({
    required this.typename,
    required this.label,
    required this.url,
  });

  final String typename;
  final String label;
  final String url;

  factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    typename: json["__typename"],
    label: json["label"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "label": label,
    "url": url,
  };
}

class RoomType {
  RoomType({
    required this.typename,
    required this.id,
    required this.name,
  });

  final String typename;
  final String id;
  final String name;

  factory RoomType.fromRawJson(String str) => RoomType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomType.fromJson(Map<String, dynamic> json) => RoomType(
    typename: json["__typename"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "__typename": typename,
    "id": id,
    "name": name,
  };
}
