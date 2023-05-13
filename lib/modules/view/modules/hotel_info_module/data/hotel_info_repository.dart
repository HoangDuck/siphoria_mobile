import 'package:final_project_hcmute/core/models/hotel_details_model.dart';

import '../domain/adapters/repository_adapter.dart';
import 'hotel_info_api_provider.dart';

class HotelInfoRepository implements IHotelInfoRepository {
  HotelInfoRepository({required this.provider});
  final IHotelInfoProvider provider;

  @override
  Future<List<RoomType>> getListRoomTypeMobile(String hotelId) async {
    // TODO: implement getListRoomTypeMobile
    final response = await provider.getListRoomTypeMobile(hotelId);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }

  @override
  Future<bool> addToCart(dataAddToCart) async {
    // TODO: implement addToCart
    final response = await provider.addToCart(dataAddToCart);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}