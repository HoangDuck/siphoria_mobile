import 'package:final_project_hcmute/core/services/local_storage.dart';
import 'package:final_project_hcmute/core/utils/utils.dart';
import 'package:final_project_hcmute/modules/view/constant/app_images.dart';
import 'package:final_project_hcmute/modules/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../routers/page_routes.dart';
import '../../../../../../widget/text_custom.dart';
import '../../../../../constant/app_colors.dart';
import '../../controllers/home_controller.dart';

Widget profilePage(BuildContext context) {
  HomeController controller = Get.find<HomeController>();
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Utils.height(150),
          child: Container(
            margin: EdgeInsets.all(Utils.width(15)),
            padding: EdgeInsets.all(Utils.width(15)),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Utils.width(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Obx(()=>Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Utils.width(50)),
                  child: Image.network(
                    controller.avatar.value,
                    scale: 5,
                    width: Utils.width(70),
                    height: Utils.width(70),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: Utils.width(10),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      controller.fullName.value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Utils.width(20),
                      ),
                    ),
                    TextCustom(
                      "Hạng thành viên: ${controller.rank}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Utils.width(17),
                          color: colorTitleAmber),
                    ),
                  ],
                )
              ],
            ),),
          ),
        ),
        _itemButtonProfile("Thông tin cá nhân", onTap: () {
          Get.toNamed(Routes.profile);
        }),
        _itemButtonProfile("Thay đổi mật khẩu", onTap: () {
          Get.toNamed(Routes.changePassword);
        }, icon: Icons.password_rounded, color: colorTitleAmber),
        _itemButtonProfile("Lịch sử đặt phòng", onTap: () {
          Get.toNamed(Routes.historyBooking);
        }, color: colorTextPrice),
        _itemButtonProfile("Đăng xuất", onTap: () {
          showMessageDialogIOS(context,
              description: "Bạn thực sự muốn đăng xuất?", onPress: () async {
            SecureStorage secureStorage = SecureStorage();
            await secureStorage.deleteAccessToken();
            await secureStorage.deleteAccessToken();
            controller.accessToken = '';
            controller.refreshToken = '';
            Get.back();
            controller.selectedPageIndex(0);
          }, onPressX: () {
            Get.back();
          }, enableCancel: true);
        }, color: appBarColor),
      ],
    ),
  );
}

Widget _itemButtonProfile(String title,
    {IconData icon = Icons.account_circle_rounded,
    required Function() onTap,
    Color color = colorTextPrice}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(Utils.width(10)),
      height: Utils.height(60),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: colorTextPrice),
          top: BorderSide(width: 0.5, color: colorTextPrice),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(
            width: Utils.width(10),
          ),
          TextCustom(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Utils.width(17),
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: color,
          )
        ],
      ),
    ),
  );
}
