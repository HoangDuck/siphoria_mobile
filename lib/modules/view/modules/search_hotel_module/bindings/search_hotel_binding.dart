import 'package:final_project_hcmute/modules/view/modules/search_hotel_module/presentations/controllers/search_hotel_controller.dart';
import 'package:get/get.dart';

import '../data/search_hotel_api_provider.dart';
import '../data/search_hotel_repository.dart';
import '../domain/adapters/repository_adapter.dart';

class SearchHotelBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<ISearchHotelProvider>(
          () => SearchHotelProvider(),
    );
    Get.lazyPut(
          () => SearchHotelController(searchHotelRepository: Get.find()),
    );
    Get.lazyPut<ISearchHotelRepository>(
          () => SearchHotelRepository(provider: Get.find()),
    );
  }

}