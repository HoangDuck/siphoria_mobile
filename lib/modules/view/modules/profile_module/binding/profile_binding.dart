import 'package:final_project_hcmute/modules/view/modules/profile_module/presentations/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
          () => ProfileController(),
    );
  }

}