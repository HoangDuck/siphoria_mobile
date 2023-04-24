
import 'package:final_project_hcmute/modules/view/modules/forgot_password/data/forgot_api_provider.dart';
import 'package:final_project_hcmute/modules/view/modules/forgot_password/domain/adapters/repository_adapter.dart';
import 'package:final_project_hcmute/modules/view/modules/forgot_password/presentations/controllers/forgot_password_controller.dart';
import 'package:get/get.dart';

import '../data/forgot_pass_repository.dart';

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