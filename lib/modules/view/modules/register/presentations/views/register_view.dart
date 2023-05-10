import 'package:final_project_hcmute/modules/view/modules/register/presentations/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/button_custom.dart';
import '../../../../../widget/text_field_custom.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_images.dart';

class RegisterView extends GetView<RegisterController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(Utils.width(15)),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                SizedBox(height: Utils.width(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Đăng ký",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorTitleAmber,
                          fontSize: Utils.width(40),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: Utils.width(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
                      padding: EdgeInsets.all(Utils.width(10)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: colorBorder),
                          borderRadius:
                          BorderRadius.circular(Utils.width(50))),
                      child: Image.asset(icGoogle,scale: 1.5,),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
                      padding: EdgeInsets.all(Utils.width(10)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: colorBorder),
                          borderRadius:
                          BorderRadius.circular(Utils.width(50))),
                      child: Image.asset(icFacebook,scale: 1.5,),
                    ),
                  ],
                ),
                SizedBox(height: Utils.width(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                        child: Divider(
                          color: colorBorder,
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: Utils.width(10)),
                        child: const Text("hoặc đăng ký với email")),
                    const Expanded(
                        child: Divider(
                          color: colorBorder,
                        )),
                  ],
                ),
                SizedBox(height: Utils.width(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(5)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Utils.width(10),
                            ),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white),
                        child: TextFieldCustom(
                          controller: controller.lastNameEditController,
                          hintText: "Họ",
                          hintTextStyle: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: Utils.width(15),
                            vertical: Utils.width(5)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Utils.width(10),
                            ),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white),
                        child: TextFieldCustom(
                          controller: controller.firstNameEditController,
                          hintText: "Tên",
                          hintTextStyle: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(5)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Utils.width(10),
                      ),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white),
                  child: TextFieldCustom(
                    controller: controller.emailEditController,
                    hintText: "Email",
                    hintTextStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(5)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Utils.width(10),
                      ),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white),
                  child: TextFieldCustom(
                    controller: controller.passwordEditController,
                    hintText: "Mật khẩu",
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    isSecureText: true,
                    hintTextStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(5)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Utils.width(10),
                      ),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white),
                  child: TextFieldCustom(
                    controller: controller.confirmPasswordEditController,
                    hintText: "Nhập lại mật khẩu",
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    isSecureText: true,
                    hintTextStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: Utils.width(40),),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Utils.width(15)),
                  height: Utils.width(46),
                  child: ButtonCustom(
                    text: 'Đăng ký',
                    onPress: (text) async {
                      await controller.registerData();
                      if(controller.isSuccessLogin.value){
                        Get.back();Get.back();
                        Get.snackbar(
                          "Siphoria",
                          "Đăng ký thành công",
                          icon: const Icon(Icons.person, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                        );
                      }else{
                        Get.snackbar(
                          "Siphoria",
                          "Đăng ký thất bại",
                          icon: const Icon(Icons.person, color: Colors.white),
                          backgroundColor: appBarColor,
                          snackPosition: SnackPosition.TOP,
                        );
                        Get.back();Get.back();
                      }
                    },
                    style: TextStyle(
                        fontSize: Utils.width(20),
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    color: colorTitleAmber,
                    borderColor: Colors.transparent,
                  ),
                ),
                SizedBox(height: Utils.width(20),),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}