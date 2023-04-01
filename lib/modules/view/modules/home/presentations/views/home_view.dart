import 'package:final_project_hcmute/modules/view/constant/app_images.dart';
import 'package:final_project_hcmute/modules/widget/button_custom.dart';
import 'package:final_project_hcmute/modules/widget/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../routers/page_routes.dart';
import '../../../../constant/app_colors.dart';
import '../controllers/home_controller.dart';
import 'component/search_hotel.dart';

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
                    fontSize: Utils.width(30),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              icBell,
              scale: 1.5,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(Utils.width(10)),
          child: Visibility(
            visible: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchHotel(context),
                SizedBox(
                  height: Utils.width(20),
                ),
                Text(
                  "Điểm đến hấp dẫn hàng đầu Việt Nam",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Utils.width(30)),
                ),
                Obx(
                  () => SizedBox(
                    height: Utils.width(200),
                    child: ListView.builder(
                      itemCount: controller.listProvinces.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(Utils.width(10)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                            Utils.width(30),
                          ),color: Colors.white),
                          child: Stack(
                            children: [
                              Container(
                                  height: Utils.width(200),
                                  width: Utils.width(150),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Utils.width(30)),color: Colors.white),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      icHcmCity,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Positioned(
                                top:0,
                                bottom:0,
                                right:0,
                                left:0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      Utils.width(15)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Utils.width(30)),

                                    ),
                                    child: Container(
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                bottom:Utils.width(10),
                                child: Align(
                                  alignment:Alignment.bottomCenter,
                                  child: Text(
                                    controller.listProvinces[index].name,
                                    style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Utils.width(30),
                ),
                Text(
                  "Loại hình khách sạn",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Utils.width(30)),
                ),
                Obx(
                      () => Container(
                    height: Utils.width(200),
                    child: ListView.builder(
                      itemCount: controller.listProvinces.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(Utils.width(10)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Utils.width(30),
                              ),color: Colors.white),
                          child: Stack(
                            children: [
                              Container(
                                  height: Utils.width(200),
                                  width: Utils.width(150),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Utils.width(30)),color: Colors.white),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      icHcmCity,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Positioned(
                                top:0,
                                bottom:0,
                                right:0,
                                left:0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      Utils.width(15)),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                bottom:Utils.width(10),
                                child: Align(
                                  alignment:Alignment.bottomCenter,
                                  child: Text(
                                    controller.listProvinces[index].name,
                                    style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Utils.width(30),
                ),
                Text(
                  "Khách sạn được yêu thích",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Utils.width(30)),
                )
              ],
            ),
          ),
        ),
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
          onTap: (index) {
            controller.onSelectedTabIndex.value = index;
            if(index==1){
              Get.toNamed(Routes.authentication);
            }
          },
        ),
      ),
    );
  }
}
