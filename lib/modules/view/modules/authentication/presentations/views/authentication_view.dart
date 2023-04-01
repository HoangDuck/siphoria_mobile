import 'package:final_project_hcmute/modules/view/constant/app_images.dart';
import 'package:final_project_hcmute/modules/view/modules/authentication/presentations/controllers/authentication_controller.dart';
import 'package:final_project_hcmute/modules/widget/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/text_field_custom.dart';
import '../../../../constant/app_colors.dart';

class AuthenticationView extends GetView<AuthenticationController> {

  @override
  AuthenticationController controller = Get.find<AuthenticationController>();
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
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                SizedBox(height: Utils.width(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Đăng nhập",
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
                        child: const Text("hoặc đăng nhập với email")),
                    const Expanded(
                        child: Divider(
                      color: colorBorder,
                    )),
                  ],
                ),
                SizedBox(height: Utils.width(20),),
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
                  margin: EdgeInsets.symmetric(horizontal: Utils.width(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Container(),),
                      Text('Quên mật khẩu?',style: TextStyle(color: Colors.black,fontSize: Utils.width(15)),)
                    ],
                  ),
                ),
                SizedBox(height: Utils.width(40),),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Utils.width(15)),
                  height: Utils.width(46),
                  child: ButtonCustom(
                    text: 'Đăng nhập',
                    onPress: (text) {},
                    style: TextStyle(
                        fontSize: Utils.width(20),
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    color: colorTitleAmber,
                    borderColor: Colors.transparent,
                  ),
                ),
                SizedBox(height: Utils.width(20),),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Utils.width(15)),
                  height: Utils.width(46),
                  child: ButtonCustom(
                    text: 'Đăng ký',
                    onPress: (text) {},
                    style: TextStyle(
                        fontSize: Utils.width(20),
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    color: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
