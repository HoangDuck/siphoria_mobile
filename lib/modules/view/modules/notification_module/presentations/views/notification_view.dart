import 'package:final_project_hcmute/modules/view/modules/notification_module/presentations/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/text_custom.dart';

class NotificationView extends GetView<NotificationController> {
  NotificationView({super.key});

  @override
  NotificationController controller = Get.find<NotificationController>();

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
                        "Thông báo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Utils.width(20),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.checklist_rtl_outlined),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
