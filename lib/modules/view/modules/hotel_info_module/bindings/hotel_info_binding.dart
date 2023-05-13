import 'package:final_project_hcmute/modules/view/modules/hotel_info_module/presentations/controllers/hotel_info_controller.dart';
import 'package:get/get.dart';

import '../data/hotel_info_api_provider.dart';
import '../data/hotel_info_repository.dart';
import '../domain/adapters/repository_adapter.dart';

class HotelInfoBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<IHotelInfoProvider>(
          () => HotelInfoProvider(),
    );
    Get.lazyPut(
          () => HotelInfoController(hotelInfoRepository: Get.find()),
    );
    Get.lazyPut<IHotelInfoRepository>(
          () => HotelInfoRepository(provider: Get.find()),
    );
  }

}