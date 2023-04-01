
import 'package:final_project_hcmute/modules/view/modules/authentication/presentations/controllers/authentication_controller.dart';
import 'package:get/get.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => AuthenticationController(),
    );
  }

}