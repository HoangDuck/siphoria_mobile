
import 'dart:convert';

RoomType roomTypeFromJson(String str) => RoomType.fromJson(json.decode(str));

String roomTypeToJson(RoomType data) => json.encode(data.toJson());

class RoomType {
  String id;
  bool activated;
  String name;
  String description;
  int maxAdult;
  int maxChildren;
  int bedNums;
  int bathroomNums;
  String photos;
  DateTime createdAt;
  DateTime updatedAt;
  String hotelId;
  dynamic hotel;
  RoomTypeFacility roomTypeFacility;
  List<RoomNight> roomNights;
  List<RatePlan> ratePlans;
  RoomTypeViews roomTypeViews;

  RoomType({
    required this.id,
    required this.activated,
    required this.name,
    required this.description,
    required this.maxAdult,
    required this.maxChildren,
    required this.bedNums,
    required this.bathroomNums,
    required this.photos,
    required this.createdAt,
    required this.updatedAt,
    required this.hotelId,
    this.hotel,
    required this.roomTypeFacility,
    required this.roomNights,
    required this.ratePlans,
    required this.roomTypeViews,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) => RoomType(
    id: json["id"],
    activated: json["activated"],
    name: json["name"],
    description: json["description"],
    maxAdult: json["max_adult"],
    maxChildren: json["max_children"],
    bedNums: json["bed_nums"],
    bathroomNums: json["bathroom_nums"],
    photos: json["photos"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    hotelId: json["hotel_id"],
    hotel: json["hotel"],
    roomTypeFacility: RoomTypeFacility.fromJson(json["room_type_facility"]),
    roomNights: List<RoomNight>.from(json["room_nights"].map((x) => RoomNight.fromJson(x))),
    ratePlans: List<RatePlan>.from(json["rate_plans"].map((x) => RatePlan.fromJson(x))),
    roomTypeViews: RoomTypeViews.fromJson(json["room_type_views"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "activated": activated,
    "name": name,
    "description": description,
    "max_adult": maxAdult,
    "max_children": maxChildren,
    "bed_nums": bedNums,
    "bathroom_nums": bathroomNums,
    "photos": photos,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "hotel_id": hotelId,
    "hotel": hotel,
    "room_type_facility": roomTypeFacility.toJson(),
    "room_nights": List<dynamic>.from(roomNights.map((x) => x.toJson())),
    "rate_plans": List<dynamic>.from(ratePlans.map((x) => x.toJson())),
    "room_type_views": roomTypeViews.toJson(),
  };

  static List<RoomType> listFromJson(list){
    List<RoomType> tempList=[];
    try{
      list.forEach((val) {
        tempList.add(RoomType.fromJson(val));
      });
      return tempList;
    }catch(e){
      return tempList;
    }
  }
}

class RatePlan {
  String id;
  String name;
  String typeRatePlan;
  int status;
  bool activate;
  DateTime createdAt;
  DateTime updatedAt;
  bool freeBreakfast;
  bool freeLunch;
  bool freeDinner;
  String roomTypeId;
  List<RatePackage> ratePackages;
  double totalPrice=0.0;

  RatePlan({
    required this.id,
    required this.name,
    required this.typeRatePlan,
    required this.status,
    required this.activate,
    required this.createdAt,
    required this.updatedAt,
    required this.freeBreakfast,
    required this.freeLunch,
    required this.freeDinner,
    required this.roomTypeId,
    required this.ratePackages,
  });

  factory RatePlan.fromJson(Map<String, dynamic> json) => RatePlan(
    id: json["id"],
    name: json["name"],
    typeRatePlan: json["type_rate_plan"],
    status: json["status"],
    activate: json["activate"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    freeBreakfast: json["free_breakfast"],
    freeLunch: json["free_lunch"],
    freeDinner: json["free_dinner"],
    roomTypeId: json["room_type_id"],
    ratePackages: List<RatePackage>.from(json["rate_packages"].map((x) => RatePackage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type_rate_plan": typeRatePlan,
    "status": status,
    "activate": activate,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "free_breakfast": freeBreakfast,
    "free_lunch": freeLunch,
    "free_dinner": freeDinner,
    "room_type_id": roomTypeId,
    "rate_packages": List<dynamic>.from(ratePackages.map((x) => x.toJson())),
  };
}

class RatePackage {
  String id;
  String currency;
  DateTime availabilityAt;
  int price;
  DateTime createdAt;
  DateTime updatedAt;
  String ratePlanId;

  RatePackage({
    required this.id,
    required this.currency,
    required this.availabilityAt,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.ratePlanId,
  });

  factory RatePackage.fromJson(Map<String, dynamic> json) => RatePackage(
    id: json["id"],
    currency: json["currency"],
    availabilityAt: DateTime.parse(json["availability_at"]),
    price: json["price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    ratePlanId: json["rate_plan_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "currency": currency,
    "availability_at": availabilityAt.toIso8601String(),
    "price": price,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "rate_plan_id": ratePlanId,
  };
}

class RoomNight {
  String id;
  DateTime availabilityAt;
  int inventory;
  int remain;
  DateTime createdAt;
  DateTime updatedAt;
  String roomTypeId;

  RoomNight({
    required this.id,
    required this.availabilityAt,
    required this.inventory,
    required this.remain,
    required this.createdAt,
    required this.updatedAt,
    required this.roomTypeId,
  });

  factory RoomNight.fromJson(Map<String, dynamic> json) => RoomNight(
    id: json["id"],
    availabilityAt: DateTime.parse(json["availability_at"]),
    inventory: json["inventory"],
    remain: json["remain"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    roomTypeId: json["room_type_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "availability_at": availabilityAt.toIso8601String(),
    "inventory": inventory,
    "remain": remain,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "room_type_id": roomTypeId,
  };
}

class RoomTypeFacility {
  String roomTypeId;
  bool airConditioner;
  bool tv;
  bool kitchen;
  bool privatePool;
  bool heater;
  bool iron;
  bool sofa;
  bool desk;
  bool soundProof;
  bool towels;
  bool toiletries;
  bool shower;
  bool slipper;
  bool hairDry;
  bool fruit;
  bool bbq;
  bool wine;
  bool fryer;
  bool kitchenTools;
  DateTime createdAt;
  DateTime updatedAt;

  RoomTypeFacility({
    required this.roomTypeId,
    required this.airConditioner,
    required this.tv,
    required this.kitchen,
    required this.privatePool,
    required this.heater,
    required this.iron,
    required this.sofa,
    required this.desk,
    required this.soundProof,
    required this.towels,
    required this.toiletries,
    required this.shower,
    required this.slipper,
    required this.hairDry,
    required this.fruit,
    required this.bbq,
    required this.wine,
    required this.fryer,
    required this.kitchenTools,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RoomTypeFacility.fromJson(Map<String, dynamic> json) => RoomTypeFacility(
    roomTypeId: json["room_type_id"],
    airConditioner: json["air_conditioner"],
    tv: json["tv"],
    kitchen: json["kitchen"],
    privatePool: json["private_pool"],
    heater: json["heater"],
    iron: json["iron"],
    sofa: json["sofa"],
    desk: json["desk"],
    soundProof: json["sound_proof"],
    towels: json["towels"],
    toiletries: json["toiletries"],
    shower: json["shower"],
    slipper: json["slipper"],
    hairDry: json["hair_dry"],
    fruit: json["fruit"],
    bbq: json["bbq"],
    wine: json["wine"],
    fryer: json["fryer"],
    kitchenTools: json["kitchen_tools"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "room_type_id": roomTypeId,
    "air_conditioner": airConditioner,
    "tv": tv,
    "kitchen": kitchen,
    "private_pool": privatePool,
    "heater": heater,
    "iron": iron,
    "sofa": sofa,
    "desk": desk,
    "sound_proof": soundProof,
    "towels": towels,
    "toiletries": toiletries,
    "shower": shower,
    "slipper": slipper,
    "hair_dry": hairDry,
    "fruit": fruit,
    "bbq": bbq,
    "wine": wine,
    "fryer": fryer,
    "kitchen_tools": kitchenTools,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class RoomTypeViews {
  String roomTypeId;
  bool bay;
  bool sea;
  bool city;
  bool garden;
  bool lake;
  bool mountain;
  bool river;
  bool privateBalcony;
  DateTime createdAt;
  DateTime updatedAt;

  RoomTypeViews({
    required this.roomTypeId,
    required this.bay,
    required this.sea,
    required this.city,
    required this.garden,
    required this.lake,
    required this.mountain,
    required this.river,
    required this.privateBalcony,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RoomTypeViews.fromJson(Map<String, dynamic> json) => RoomTypeViews(
    roomTypeId: json["room_type_id"],
    bay: json["bay"],
    sea: json["sea"],
    city: json["city"],
    garden: json["garden"],
    lake: json["lake"],
    mountain: json["mountain"],
    river: json["river"],
    privateBalcony: json["private_balcony"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "room_type_id": roomTypeId,
    "bay": bay,
    "sea": sea,
    "city": city,
    "garden": garden,
    "lake": lake,
    "mountain": mountain,
    "river": river,
    "private_balcony": privateBalcony,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
