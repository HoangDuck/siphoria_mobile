import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/local_storage.dart';
import '../../../home/presentations/controllers/home_controller.dart';
import '../../domain/adapters/repository_adapters.dart';

class RegisterController extends GetxController{
  final IRegisterRepository registerRepository;
  RegisterController({required this.registerRepository});
  TextEditingController firstNameEditController =TextEditingController();
  TextEditingController lastNameEditController =TextEditingController();
  TextEditingController emailEditController =TextEditingController();
  TextEditingController passwordEditController =TextEditingController();
  TextEditingController confirmPasswordEditController =TextEditingController();
  RxBool isSuccessLogin = false.obs;

  registerData() async {
    if(confirmPasswordEditController.text == passwordEditController.text){
      var token = await registerRepository.signUp(emailEditController.text,passwordEditController.text,firstNameEditController.text,lastNameEditController.text);
      if(token.accessToken.isNotEmpty){
        SecureStorage storage = SecureStorage();
        await storage.saveAccessToken(token.accessToken);
        await storage.saveRefreshToken(token.refreshToken);
        HomeController controller = Get.find<HomeController>();
        controller.accessToken=token.accessToken;
        controller.refreshToken = token.refreshToken;
        isSuccessLogin.value = true;
      }
    }
  }

}