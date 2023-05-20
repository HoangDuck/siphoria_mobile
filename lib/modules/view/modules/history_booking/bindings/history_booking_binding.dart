
import 'package:final_project_hcmute/modules/view/modules/history_booking/presentations/controllers/history_booking_controller.dart';
import 'package:get/get.dart';

import '../data/history_booking_api_provider.dart';
import '../data/history_booking_repository.dart';
import '../domain/adapters/repository_adapter.dart';

class HistoryBookingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IHistoryBookingProvider>(
          () => HistoryBookingProvider(),
    );
    Get.lazyPut<IHistoryBookingRepository>(
          () => HistoryBookingRepository(provider: Get.find()),
    );
    Get.lazyPut(
          () => HistoryBookingController(historyBookingRepository: Get.find()),
    );
  }

}