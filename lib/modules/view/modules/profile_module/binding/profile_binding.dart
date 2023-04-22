import 'package:final_project_hcmute/modules/view/modules/profile_module/presentations/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../data/userprofile_api_provider.dart';
import '../data/userprofile_repository.dart';
import '../domain/adapter/repository_adapter.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IUserProfileProvider>(
          () => UserProfileProvider(),
    );
    Get.lazyPut(
          () => ProfileController(userProfileRepository: Get.find()),
    );
    Get.lazyPut<IUserProfileRepository>(
          () => UserProfileRepository(provider: Get.find()),
    );
  }

}