import 'package:final_project_hcmute/modules/view/constant/app_images.dart';
import 'package:final_project_hcmute/modules/widget/button_custom.dart';
import 'package:final_project_hcmute/modules/widget/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../routers/page_routes.dart';
import '../../../../constant/app_colors.dart';
import '../../../search_hotel_module/presentations/views/component/item_hotel_search_view.dart';
import '../../domain/entities/cart_item_model.dart';
import '../controllers/home_controller.dart';
import 'child_page/booking_page.dart';
import 'child_page/profile_page.dart';
import 'component/search_hotel.dart';

part 'child_page/home_page.dart';

part 'child_page/cart_page.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBarColor,
        shadowColor: Colors.white,
        title: SizedBox(
          height: Utils.width(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(icSiphoria),
              SizedBox(
                width: Utils.width(10),
              ),
              Text(
                "Siphoria".toUpperCase(),
                style: TextStyle(
                    fontSize: Utils.width(30), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.notification);
            },
            child: Image.asset(
              icBell,
              scale: 1.5,
            ),
          )
        ],
      ),
      body: PageView(
        controller: controller.pageController.value,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _homePage(context),
          _cartPage(context),
          myBooking(context),
          profilePage(context),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Khám phá',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Giỏ hàng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Đặt chỗ của tôi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Tài khoản',
            ),
          ],
          currentIndex: controller.onSelectedTabIndex.value,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.black26,
          onTap: (index) => controller.selectedPageIndex(index),
        ),
      ),
    );
  }
}
