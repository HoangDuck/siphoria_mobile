
import 'package:final_project_hcmute/core/models/hotel_details_model.dart';
import 'package:get/get.dart';

import '../../../../../core/services/api_constant.dart';
import '../../home/presentations/controllers/home_controller.dart';

abstract class IHotelInfoProvider {
  Future<Response<List<RoomType>>> getListRoomTypeMobile(String hotelId);
  Future<Response<bool>> addToCart(dynamic data);
}

class HotelInfoProvider extends GetConnect implements IHotelInfoProvider{
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    super.onInit();
  }

  @override
  Future<Response<List<RoomType>>> getListRoomTypeMobile(String hotelId) async {
    httpClient.defaultDecoder = RoomType.listFromJson;
    return await get('$getListRoomTypeUrl/$hotelId');
  }

  @override
  Future<Response<bool>> addToCart(data) async {
    HomeController controller = Get.find<HomeController>();
    // TODO: implement addToCart
    httpClient.defaultDecoder = httpClient.defaultDecoder = (value) => resultBoolDeCode(value);
    return await post(addToCartUrl,data,headers: {
      'Authorization':'Bearer ${controller.accessToken}'
    });
  }

  bool resultBoolDeCode(dynamic data){
    return data['data'].toString().toLowerCase()=='true';
  }

}