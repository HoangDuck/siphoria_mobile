
import 'package:final_project_hcmute/modules/view/modules/booking_details/presentations/controllers/booking_detail_controller.dart';
import 'package:get/get.dart';

class BookingDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
          () => BookingDetailController(),
    );
  }

}