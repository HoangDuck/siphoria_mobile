import 'package:final_project_hcmute/core/services/api_constant.dart';
import 'package:get/get.dart';

abstract class IForgotPasswordProvider {
  Future<Response<void>> sendEmailResetPassword(String email);
}

class ForgotPasswordProvider extends GetConnect
    implements IForgotPasswordProvider {
  @override
  void onInit() {
    httpClient.baseUrl =baseUrl;
    super.onInit();
  }

  @override
  Future<Response> sendEmailResetPassword(String email) {
    return post(forgotPasswordUrl, {"email": email});
  }

}
