
import 'package:final_project_hcmute/modules/view/modules/register/presentations/controllers/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
          () => RegisterController(),
    );
  }

}