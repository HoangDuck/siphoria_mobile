import 'package:final_project_hcmute/modules/view/modules/hotel_info_module/presentations/controllers/hotel_info_controller.dart';
import 'package:get/get.dart';

class HotelInfoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
          () => HotelInfoController(),
    );
  }

}