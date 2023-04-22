
import 'package:final_project_hcmute/modules/view/modules/authentication/data/authentication_api_provider.dart';
import 'package:final_project_hcmute/modules/view/modules/authentication/data/authentication_repository.dart';
import 'package:final_project_hcmute/modules/view/modules/authentication/presentations/controllers/authentication_controller.dart';
import 'package:get/get.dart';

import '../domain/adapters/repository_adapter.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthenticationProvider>(
          () => AuthenticationProvider(),
    );
    Get.lazyPut(
          () => AuthenticationController(authenticationRepository: Get.find()),
    );
    Get.lazyPut<IAuthenticationRepository>(
          () => AuthenticationRepository(provider: Get.find()),
    );
  }

}