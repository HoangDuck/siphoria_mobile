

import 'package:final_project_hcmute/core/models/hotel_details_model.dart';

abstract class IHotelInfoRepository {
  Future<List<RoomType>> getListRoomTypeMobile(String hotelId);
  Future<bool> addToCart(dynamic dataAddToCart);
}
