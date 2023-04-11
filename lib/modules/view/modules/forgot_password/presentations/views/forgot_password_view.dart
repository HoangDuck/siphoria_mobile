import 'package:final_project_hcmute/modules/view/modules/forgot_password/presentations/controllers/forgot_password_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/button_custom.dart';
import '../../../../../widget/text_custom.dart';
import '../../../../../widget/text_field_custom.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_images.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(Utils.width(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Utils.width(10),
                  vertical: Utils.height(5),
                ),
                height: Utils.height(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    Expanded(
                      child: TextCustom(
                        "Thay đổi mật khẩu",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Utils.width(20),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container()
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: Utils.width(15),
                      ),
                      Container(
                        margin: EdgeInsets.all(Utils.width(7)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Utils.width(10),
                            ),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white),
                        child: TextFieldCustom(
                          controller: controller.emailEditingController,
                          // prefixIcon: const Icon(Icons.search,color: Colors.black,),
                          textAlignVertical: TextAlignVertical.top,
                          hintText: "Nhập email",
                          hintTextStyle: const TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: Utils.width(15),
                      ),
                      Container(
                        margin:
                        EdgeInsets.symmetric(horizontal: Utils.width(8)),
                        height: Utils.width(46),
                        width: MediaQuery.of(context).size.width,
                        child: ButtonCustom(
                          text: 'Thay đổi mật khẩu',
                          onPress: (text) {},
                          style: TextStyle(
                              fontSize: Utils.width(20),
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          color: colorTitleAmber,
                          borderColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}