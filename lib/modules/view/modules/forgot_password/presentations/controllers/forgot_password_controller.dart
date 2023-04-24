import 'package:final_project_hcmute/modules/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/adapters/repository_adapter.dart';

class ForgotPasswordController extends GetxController{
  final IForgotPasswordRepository forgotPasswordRepository;
  ForgotPasswordController({required this.forgotPasswordRepository});
  TextEditingController emailEditingController=TextEditingController();

  sendEmailResetPasswordData() async {
    var token = await forgotPasswordRepository.sendEmailResetPass(emailEditingController.text);

  }
}