
import 'package:final_project_hcmute/modules/view/modules/forgot_password/presentations/controllers/forgot_password_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
          () => ForgotPasswordController(),
    );
  }

}