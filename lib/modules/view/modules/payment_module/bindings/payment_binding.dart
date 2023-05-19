
import 'package:get/get.dart';

import '../data/payment_api_provider.dart';
import '../data/payment_repository.dart';
import '../domain/adapters/repository_adapter.dart';
import '../presentations/controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPaymentProvider>(
          () => PaymentProvider(),
    );
    Get.lazyPut<IPaymentRepository>(
          () => PaymentRepository(provider: Get.find()),
    );
    Get.lazyPut(
          () => PaymentController(paymentRepository: Get.find()),
    );
  }

}