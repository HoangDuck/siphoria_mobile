import 'package:final_project_hcmute/modules/view/modules/search_hotel_module/presentations/controllers/search_hotel_controller.dart';
import 'package:get/get.dart';

class SearchHotelBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
          () => SearchHotelController(),
    );
  }

}