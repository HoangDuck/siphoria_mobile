import 'package:final_project_hcmute/modules/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../home/presentations/controllers/home_controller.dart';
import '../../domain/adapters/repository_adapter.dart';

class ChangePasswordController extends GetxController{
  final IChangePasswordRepository changePasswordRepository;
  ChangePasswordController({required this.changePasswordRepository});
  TextEditingController oldPasswordEditingController=TextEditingController();
  TextEditingController newPasswordEditingController=TextEditingController();
  TextEditingController newPasswordConfirmEditingController=TextEditingController();
  HomeController homeController = Get.find<HomeController>();

  changePasswordUser() async {
    if(newPasswordConfirmEditingController.text==newPasswordEditingController.text){
      var result = await changePasswordRepository.changePassword(
          oldPasswordEditingController.text, newPasswordEditingController.text);
      if (result) {
        homeController.selectedPageIndex(0);
        Get.back();
        Get.snackbar('Thay đổi mật khẩu thành công', "Quý khách có thể đăng nhập tài khoản với mật khẩu mới");
        refresh();
      }else{
        Get.snackbar('Thay đổi mật khẩu thất bại', "Quý khách vui lòng thử lại");
      }
    }else{
      Get.snackbar('Mật khẩu không khớp', "Quý khách nhập lại cho đúng");
    }
  }

}