import 'package:final_project_hcmute/core/services/api_constant.dart';
import 'package:get/get.dart';

import '../../../home/presentations/controllers/home_controller.dart';

abstract class IChangePasswordProvider {
  Future<Response<void>> changePassword(String oldPassword, String newPassword);
}

class ChangePasswordProvider extends GetConnect
    implements IChangePasswordProvider {
  @override
  void onInit() {
    httpClient.baseUrl =baseUrl;
    super.onInit();
  }

  @override
  Future<Response<void>> changePassword(String oldPassword, String newPassword) {
    // TODO: implement changePassword
    HomeController controller = Get.find<HomeController>();
    return post(changePasswordUrl,{
      'password': oldPassword,
      'new_password': newPassword
    },headers: {
      'Authorization':'Bearer ${controller.accessToken}'
    });
  }


}
