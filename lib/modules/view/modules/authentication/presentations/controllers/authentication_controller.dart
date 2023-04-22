import 'package:final_project_hcmute/modules/view/modules/authentication/data/authentication_api_provider.dart';
import 'package:final_project_hcmute/modules/view/modules/authentication/domain/adapters/repository_adapter.dart';
import 'package:final_project_hcmute/modules/view/modules/home/presentations/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/local_storage.dart';

class AuthenticationController extends GetxController{
  final IAuthenticationRepository authenticationRepository;
  AuthenticationController({required this.authenticationRepository});
  TextEditingController emailEditController =TextEditingController();
  TextEditingController passwordEditController =TextEditingController();
  RxBool isSuccessLogin = false.obs;

  authenticationData() async {
    var token = await authenticationRepository.signIn(emailEditController.text,passwordEditController.text);
    if(token.accessToken.isNotEmpty){
      SecureStorage storage = SecureStorage();
      await storage.saveAccessToken(token.accessToken);
      await storage.saveRefreshToken(token.refreshToken);
      HomeController controller = Get.find<HomeController>();
      controller.accessToken=token.accessToken;
      controller.refreshToken = token.refreshToken;
      isSuccessLogin.value=true;
    }
  }
}