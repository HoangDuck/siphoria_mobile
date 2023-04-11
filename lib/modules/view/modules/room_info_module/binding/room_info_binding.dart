
import 'package:final_project_hcmute/modules/view/modules/room_info_module/presentations/controllers/room_info_controller.dart';
import 'package:get/get.dart';

class RoomInfoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
          () => RoomInfoController(),
    );
  }

}