
import 'package:get/get.dart';

import '../presentations/controllers/notification_controller.dart';

class NotificationBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
          () => NotificationController(),
    );
  }

}