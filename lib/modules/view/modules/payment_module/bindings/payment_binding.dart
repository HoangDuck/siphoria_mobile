
import 'package:get/get.dart';

import '../presentations/controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => PaymentController(),
    );
  }

}