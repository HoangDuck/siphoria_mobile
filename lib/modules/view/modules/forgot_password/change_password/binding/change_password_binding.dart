
import 'package:get/get.dart';

import '../data/change_password_api_provider.dart';
import '../data/change_pass_repository.dart';
import '../domain/adapters/repository_adapter.dart';
import '../presentations/controllers/change_password_controller.dart';

class ChangePasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IChangePasswordProvider>(
          () => ChangePasswordProvider(),
    );
    Get.lazyPut(
      () => ChangePasswordController(
        changePasswordRepository: Get.find(),
      ),
    );
    Get.lazyPut<IChangePasswordRepository>(
          () =>ChangePasswordRepository(provider: Get.find()),
    );
  }

}