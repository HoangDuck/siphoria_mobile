
import 'dart:convert';

List<PaymentModel> paymentModelFromJson(List<dynamic> data) {
  return List<PaymentModel>.from(json.decode(json.encode(data)).map((x) => PaymentModel.fromJson(x)));
}

String paymentModelToJson(List<PaymentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentModel {
  String id;
  int price;
  DateTime dayOff;
  String paymentMethod;
  int adultNum;
  int childrenNum;
  int convertedPrice;
  int rankPrice;
  int voucherPrice;
  int totalPrice;
  DateTime startAt;
  DateTime endAt;
  int totalDay;
  String status;
  String userId;
  User user;
  String roomTypeId;
  RoomType roomType;
  String voucherId;
  String payoutRequestId;
  String hotelId;
  Hotel hotel;
  String sessionId;
  String ratePlanId;
  RatePlan ratePlan;
  DateTime createdAt;
  DateTime updatedAt;
  String cartId;
  List<PaymentDetail> paymentDetails;

  PaymentModel({
    required this.id,
    required this.price,
    required this.dayOff,
    required this.paymentMethod,
    required this.adultNum,
    required this.childrenNum,
    required this.convertedPrice,
    required this.rankPrice,
    required this.voucherPrice,
    required this.totalPrice,
    required this.startAt,
    required this.endAt,
    required this.totalDay,
    required this.status,
    required this.userId,
    required this.user,
    required this.roomTypeId,
    required this.roomType,
    required this.voucherId,
    required this.payoutRequestId,
    required this.hotelId,
    required this.hotel,
    required this.sessionId,
    required this.ratePlanId,
    required this.ratePlan,
    required this.createdAt,
    required this.updatedAt,
    required this.cartId,
    required this.paymentDetails,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    id: json["id"],
    price: json["price"],
    dayOff: DateTime.parse(json["day_off"]),
    paymentMethod: json["payment_method"],
    adultNum: json["adult_num"],
    childrenNum: json["children_num"],
    convertedPrice: json["converted_price"],
    rankPrice: json["rank_price"],
    voucherPrice: json["voucher_price"],
    totalPrice: json["total_price"],
    startAt: DateTime.parse(json["start_at"]),
    endAt: DateTime.parse(json["end_at"]),
    totalDay: json["total_day"],
    status: json["status"],
    userId: json["user_id"],
    user: User.fromJson(json["user"]),
    roomTypeId: json["room_type_id"],
    roomType: RoomType.fromJson(json["room_type"]),
    voucherId: json["voucher_id"],
    payoutRequestId: json["payout_request_id"],
    hotelId: json["hotel_id"],
    hotel: Hotel.fromJson(json["hotel"]),
    sessionId: json["session_id"],
    ratePlanId: json["rate_plan_id"],
    ratePlan: RatePlan.fromJson(json["rate_plan"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    cartId: json["cart_id"],
    paymentDetails: List<PaymentDetail>.from(json["payment_details"].map((x) => PaymentDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "day_off": dayOff.toIso8601String(),
    "payment_method": paymentMethod,
    "adult_num": adultNum,
    "children_num": childrenNum,
    "converted_price": convertedPrice,
    "rank_price": rankPrice,
    "voucher_price": voucherPrice,
    "total_price": totalPrice,
    "start_at": startAt.toIso8601String(),
    "end_at": endAt.toIso8601String(),
    "total_day": totalDay,
    "status": status,
    "user_id": userId,
    "user": user.toJson(),
    "room_type_id": roomTypeId,
    "room_type": roomType.toJson(),
    "voucher_id": voucherId,
    "payout_request_id": payoutRequestId,
    "hotel_id": hotelId,
    "hotel": hotel.toJson(),
    "session_id": sessionId,
    "rate_plan_id": ratePlanId,
    "rate_plan": ratePlan.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "cart_id": cartId,
    "payment_details": List<dynamic>.from(paymentDetails.map((x) => x.toJson())),
  };
}

class Hotel {
  String id;
  String name;
  String overview;
  int rating;
  double commissionRate;
  DateTime createdAt;
  DateTime updatedAt;
  int status;
  bool activate;
  int provinceCode;
  int districtCode;
  int wardCode;
  String rawAddress;
  String hotelPhotos;
  String bankAccount;
  String bankBeneficiary;
  String bankName;
  String businessLicence;
  String hotelierId;
  int priceHotel;
  int discountPrice;
  int discountHotel;

  Hotel({
    required this.id,
    required this.name,
    required this.overview,
    required this.rating,
    required this.commissionRate,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.activate,
    required this.provinceCode,
    required this.districtCode,
    required this.wardCode,
    required this.rawAddress,
    required this.hotelPhotos,
    required this.bankAccount,
    required this.bankBeneficiary,
    required this.bankName,
    required this.businessLicence,
    required this.hotelierId,
    required this.priceHotel,
    required this.discountPrice,
    required this.discountHotel,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    id: json["id"],
    name: json["name"],
    overview: json["overview"],
    rating: json["rating"],
    commissionRate: json["commission_rate"]?.toDouble(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    status: json["status"],
    activate: json["activate"],
    provinceCode: json["province_code"],
    districtCode: json["district_code"],
    wardCode: json["ward_code"],
    rawAddress: json["raw_address"],
    hotelPhotos: json["hotel_photos"],
    bankAccount: json["bank_account"],
    bankBeneficiary: json["bank_beneficiary"],
    bankName: json["bank_name"],
    businessLicence: json["business_licence"],
    hotelierId: json["hotelier_id"],
    priceHotel: json["price_hotel"],
    discountPrice: json["discount_price"],
    discountHotel: json["discount_hotel"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "overview": overview,
    "rating": rating,
    "commission_rate": commissionRate,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "status": status,
    "activate": activate,
    "province_code": provinceCode,
    "district_code": districtCode,
    "ward_code": wardCode,
    "raw_address": rawAddress,
    "hotel_photos": hotelPhotos,
    "bank_account": bankAccount,
    "bank_beneficiary": bankBeneficiary,
    "bank_name": bankName,
    "business_licence": businessLicence,
    "hotelier_id": hotelierId,
    "price_hotel": priceHotel,
    "discount_price": discountPrice,
    "discount_hotel": discountHotel,
  };
}

class PaymentDetail {
  String id;
  int price;
  int adultNum;
  int childrenNum;
  DateTime dayOff;
  String paymentId;
  String ratePlanId;
  String userId;
  String ratePackageId;

  PaymentDetail({
    required this.id,
    required this.price,
    required this.adultNum,
    required this.childrenNum,
    required this.dayOff,
    required this.paymentId,
    required this.ratePlanId,
    required this.userId,
    required this.ratePackageId,
  });

  factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
    id: json["id"],
    price: json["price"],
    adultNum: json["adult_num"],
    childrenNum: json["children_num"],
    dayOff: DateTime.parse(json["day_off"]),
    paymentId: json["payment_id"],
    ratePlanId: json["rate_plan_id"],
    userId: json["user_id"],
    ratePackageId: json["rate_package_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "adult_num": adultNum,
    "children_num": childrenNum,
    "day_off": dayOff.toIso8601String(),
    "payment_id": paymentId,
    "rate_plan_id": ratePlanId,
    "user_id": userId,
    "rate_package_id": ratePackageId,
  };
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
  dynamic ratePackages;

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
    this.ratePackages,
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
    ratePackages: json["rate_packages"],
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
    "rate_packages": ratePackages,
  };
}

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
  dynamic roomNights;
  dynamic ratePlans;
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
    this.roomNights,
    this.ratePlans,
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
    roomNights: json["room_nights"],
    ratePlans: json["rate_plans"],
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
    "room_nights": roomNights,
    "rate_plans": ratePlans,
    "room_type_views": roomTypeViews.toJson(),
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

class User {
  String id;
  String avatar;
  String email;
  String firstName;
  String lastName;
  String fullName;
  String phone;
  bool gender;
  String role;
  int status;
  String userKeyFirebase;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic userRank;

  User({
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
    this.userRank,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    userRank: json["user_rank"],
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
    "user_rank": userRank,
  };
}
