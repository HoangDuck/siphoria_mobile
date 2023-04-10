
import 'package:final_project_hcmute/modules/view/modules/history_booking/presentations/controllers/history_booking_controller.dart';
import 'package:get/get.dart';

class HistoryBookingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
          () => HistoryBookingController(),
    );
  }

}