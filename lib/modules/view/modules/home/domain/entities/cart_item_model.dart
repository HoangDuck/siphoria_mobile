
import 'dart:convert';

class CartModel {
  CartModel({
    required this.convertedPrice,
    required this.currency,
    required this.estimatedCurrency,
    required this.estimatedPrice,
    required this.id,
    required this.isSoldOut,
    required this.metadata,
    required this.price,
    required this.product,
  });

  final int convertedPrice;
  final dynamic currency;
  final String estimatedCurrency;
  final int estimatedPrice;
  final String id;
  final bool isSoldOut;
  final Metadata metadata;
  final dynamic price;
  final Product product;

  factory CartModel.fromRawJson(String str) => CartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    convertedPrice: json["converted_price"],
    currency: json["currency"],
    estimatedCurrency: json["estimated_currency"],
    estimatedPrice: json["estimated_price"],
    id: json["id"],
    isSoldOut: json["is_sold_out"],
    metadata: Metadata.fromJson(json["metadata"]),
    price: json["price"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "converted_price": convertedPrice,
    "currency": currency,
    "estimated_currency": estimatedCurrency,
    "estimated_price": estimatedPrice,
    "id": id,
    "is_sold_out": isSoldOut,
    "metadata": metadata.toJson(),
    "price": price,
    "product": product.toJson(),
  };
}

class Metadata {
  Metadata({
    required this.availableAt,
    required this.availableTo,
    required this.numberOfAdults,
    required this.numberOfChildren,
    required this.numberOfInfants,
    required this.numberOfPets,
    required this.ratePlanId,
    required this.timezone,
    required this.totalDays,
  });

  final int availableAt;
  final int availableTo;
  final int numberOfAdults;
  final int numberOfChildren;
  final int numberOfInfants;
  final int numberOfPets;
  final String ratePlanId;
  final String timezone;
  final int totalDays;

  factory Metadata.fromRawJson(String str) => Metadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    availableAt: json["available_at"],
    availableTo: json["available_to"],
    numberOfAdults: json["number_of_adults"],
    numberOfChildren: json["number_of_children"],
    numberOfInfants: json["number_of_infants"],
    numberOfPets: json["number_of_pets"],
    ratePlanId: json["rate_plan_id"],
    timezone: json["timezone"],
    totalDays: json["total_days"],
  );

  Map<String, dynamic> toJson() => {
    "available_at": availableAt,
    "available_to": availableTo,
    "number_of_adults": numberOfAdults,
    "number_of_children": numberOfChildren,
    "number_of_infants": numberOfInfants,
    "number_of_pets": numberOfPets,
    "rate_plan_id": ratePlanId,
    "timezone": timezone,
    "total_days": totalDays,
  };
}

class Product {
  Product({
    required this.name,
    required this.photos,
    required this.property,
    required this.roomStayings,
  });

  final String name;
  final List<Photo> photos;
  final Property property;
  final List<RoomStaying> roomStayings;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    property: Property.fromJson(json["property"]),
    roomStayings: List<RoomStaying>.from(json["room_stayings"].map((x) => RoomStaying.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "property": property.toJson(),
    "room_stayings": List<dynamic>.from(roomStayings.map((x) => x.toJson())),
  };
}

class Photo {
  Photo({
    required this.url,
  });

  final String url;

  factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

class Property {
  Property({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory Property.fromRawJson(String str) => Property.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class RoomStaying {
  RoomStaying({
    required this.addOns,
    required this.availableAt,
    required this.breakfastPrice,
    required this.convertedDiscountAmount,
    required this.convertedPrice,
    required this.currency,
    required this.diningSupport,
    required this.extraBedPrice,
    required this.maximumPersonFreeMeal,
    required this.percentDiscount,
    required this.price,
    required this.promotions,
    required this.vouchers,
  });

  final AddOns addOns;
  final int availableAt;
  final dynamic breakfastPrice;
  final int convertedDiscountAmount;
  final int convertedPrice;
  final String currency;
  final dynamic diningSupport;
  final dynamic extraBedPrice;
  final dynamic maximumPersonFreeMeal;
  final int percentDiscount;
  final int price;
  final List<dynamic> promotions;
  final List<dynamic> vouchers;

  factory RoomStaying.fromRawJson(String str) => RoomStaying.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomStaying.fromJson(Map<String, dynamic> json) => RoomStaying(
    addOns: AddOns.fromJson(json["add_ons"]),
    availableAt: json["available_at"],
    breakfastPrice: json["breakfast_price"],
    convertedDiscountAmount: json["converted_discount_amount"],
    convertedPrice: json["converted_price"],
    currency: json["currency"],
    diningSupport: json["dining_support"],
    extraBedPrice: json["extra_bed_price"],
    maximumPersonFreeMeal: json["maximum_person_free_meal"],
    percentDiscount: json["percent_discount"],
    price: json["price"],
    promotions: List<dynamic>.from(json["promotions"].map((x) => x)),
    vouchers: List<dynamic>.from(json["vouchers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "add_ons": addOns.toJson(),
    "available_at": availableAt,
    "breakfast_price": breakfastPrice,
    "converted_discount_amount": convertedDiscountAmount,
    "converted_price": convertedPrice,
    "currency": currency,
    "dining_support": diningSupport,
    "extra_bed_price": extraBedPrice,
    "maximum_person_free_meal": maximumPersonFreeMeal,
    "percent_discount": percentDiscount,
    "price": price,
    "promotions": List<dynamic>.from(promotions.map((x) => x)),
    "vouchers": List<dynamic>.from(vouchers.map((x) => x)),
  };
}

class AddOns {
  AddOns({
    required this.airportPickUp,
    required this.extraPerson,
  });

  final dynamic airportPickUp;
  final dynamic extraPerson;

  factory AddOns.fromRawJson(String str) => AddOns.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddOns.fromJson(Map<String, dynamic> json) => AddOns(
    airportPickUp: json["airportPickUp"],
    extraPerson: json["extra_person"],
  );

  Map<String, dynamic> toJson() => {
    "airportPickUp": airportPickUp,
    "extra_person": extraPerson,
  };
}