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
    commissionRate: json["commission_rate"],
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


  static List<Hotel> listFromJson(list){
    List<Hotel> tempList=[];
    try{
      list.forEach((val) {
        tempList.add(Hotel.fromJson(val));
      });
      return tempList;
    }catch(e){
      return tempList;
    }
  }
}
