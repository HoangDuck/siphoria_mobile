
import 'package:get/get.dart';

import '../data/forgot_api_provider.dart';
import '../data/forgot_pass_repository.dart';
import '../domain/adapters/repository_adapter.dart';
import '../presentations/controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IForgotPasswordProvider>(
          () => ForgotPasswordProvider(),
    );
    Get.lazyPut(
      () => ForgotPasswordController(
        forgotPasswordRepository: Get.find(),
      ),
    );
    Get.lazyPut<IForgotPasswordRepository>(
          () =>ForgotPasswordRepository(provider: Get.find()),
    );
  }

}