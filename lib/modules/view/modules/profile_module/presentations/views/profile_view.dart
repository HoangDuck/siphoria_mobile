import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/button_custom.dart';
import '../../../../../widget/text_custom.dart';
import '../../../../../widget/text_field_custom.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_images.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
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
                        "Cập nhật thông tin cá nhân",
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
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: colorTitleAmber,
                                  width: Utils.width(5)),
                              borderRadius: BorderRadius.circular(
                                Utils.width(100),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(Utils.width(100)),
                              child: Image.network(
                                icHoChiMinhCity,
                                scale: 5,
                                width: Utils.width(150),
                                height: Utils.width(150),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                padding: EdgeInsets.all(Utils.width(10)),
                                decoration: BoxDecoration(
                                    color: colorButtonCart,
                                    borderRadius:
                                        BorderRadius.circular(Utils.width(30))),
                                child: const Icon(Icons.camera_alt),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                          controller: controller.lastNameEditingController,
                          // prefixIcon: const Icon(Icons.search,color: Colors.black,),
                          textAlignVertical: TextAlignVertical.top,
                          hintText: "Họ",
                          hintTextStyle: const TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500),
                        ),
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
                          controller: controller.firstNameEditingController,
                          // prefixIcon: const Icon(Icons.search,color: Colors.black,),
                          textAlignVertical: TextAlignVertical.top,
                          hintText: "Tên",
                          hintTextStyle: const TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500),
                        ),
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
                          controller: controller.phoneEditingController,
                          textAlignVertical: TextAlignVertical.top,
                          hintText: "Số điện thoại",
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
                          text: 'Cập nhật',
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
