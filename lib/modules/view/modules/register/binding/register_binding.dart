
import 'package:final_project_hcmute/modules/view/modules/register/presentations/controllers/register_controller.dart';
import 'package:get/get.dart';

import '../data/register_api_provider.dart';
import '../data/register_repository.dart';
import '../domain/adapters/repository_adapters.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IRegisterProvider>(
          () => RegisterProvider(),
    );
    Get.lazyPut(
          () => RegisterController(registerRepository: Get.find()),
    );
    Get.lazyPut<IRegisterRepository>(
          () => RegisterRepository(provider: Get.find()),
    );
  }

}