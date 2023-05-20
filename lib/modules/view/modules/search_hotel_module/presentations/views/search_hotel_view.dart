import 'package:final_project_hcmute/core/utils/utils.dart';
import 'package:final_project_hcmute/modules/view/modules/search_hotel_module/presentations/controllers/search_hotel_controller.dart';
import 'package:final_project_hcmute/modules/widget/text_custom.dart';
import 'package:final_project_hcmute/routers/page_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_images.dart';
import '../../../home/presentations/controllers/home_controller.dart';
import 'component/item_hotel_search_view.dart';

class SearchHotelView extends GetView<SearchHotelController> {
  HomeController homeController = Get.find<HomeController>();
  @override
  SearchHotelController controller = Get.find<SearchHotelController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Utils.height(200),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: Utils.width(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(Utils.width(40)),
                        bottomLeft: Radius.circular(Utils.width(40)),
                      ),
                      child: Image.network(
                        icHoChiMinhCity,
                        scale: 1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: Utils.width(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(Utils.width(40)),
                        bottomLeft: Radius.circular(Utils.width(40)),
                      ),
                      child: Container(
                        color: Colors.black26,
                      )
                    ),
                  ),
                  Positioned.fill(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(Utils.width(10)),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                padding: EdgeInsets.all(Utils.width(5)),
                                decoration: BoxDecoration(
                                    color: colorButtonCart.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(
                                        Utils.width(30))),
                                child: const Icon(Icons.arrow_back_ios_new),
                              ),
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(Utils.width(5)),
                                decoration: BoxDecoration(
                                    color:
                                    colorButtonCart.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(
                                        Utils.width(30))),
                                child: const Icon(
                                    Icons.manage_search_rounded),
                              ),
                            ),
                            SizedBox(width: Utils.width(5),),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    homeController.selectedPageIndex(1);
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(Utils.width(5)),
                                    decoration: BoxDecoration(
                                        color:
                                            colorButtonCart.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(
                                            Utils.width(30))),
                                    child: const Icon(
                                        Icons.shopping_cart_rounded),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Obx(()=>Visibility(
                                    visible: controller.homeController.totalNumberCartItem.value > 0,
                                    child: Container(
                                      width: Utils.width(18),
                                      height: Utils.width(18),
                                      padding: EdgeInsets.all(Utils.width(5)),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(80),
                                          color: Colors.red),
                                      alignment: Alignment.center,
                                      child: TextCustom(
                                        controller.totalCart.value.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Utils.width(7),
                                        ),
                                      ),
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Utils.height(100),
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(()=>TextCustom(
                              "${controller.city.value} (${controller.numberOfHotels.value})",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: Utils.width(25),
                                fontWeight: FontWeight.bold,
                                color: colorTextBold,
                              ),
                            )),
                          ],
                        ),
                        Obx(() => TextCustom(
                              "${controller.startDate.value} - ${controller.endDate.value} x ${controller.totalCustomer.value} khách",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: Utils.width(15),
                                fontWeight: FontWeight.bold,
                                color: colorTextBold,
                              ),
                            )),
                      ],
                    ),
                  ),
                  // Positioned(
                  //   left: Utils.width(30),
                  //   right: Utils.width(30),
                  //   bottom: 0,
                  //   child: Container(
                  //     height: Utils.height(50),
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(
                  //           Utils.width(15),
                  //         ),
                  //         color: Colors.white
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         // Expanded(
                  //         //   flex: 2,
                  //         //   child: TextCustom(
                  //         //     "Lọc",
                  //         //     textAlign: TextAlign.center,
                  //         //     style: const TextStyle(fontWeight: FontWeight.w500),
                  //         //     icon: Icons.keyboard_arrow_down,
                  //         //   ),
                  //         // ),
                  //         // const VerticalDivider(),
                  //         Expanded(
                  //           flex: 2,
                  //           child: TextCustom(
                  //             "Giá",
                  //             textAlign: TextAlign.center,
                  //             style: const TextStyle(
                  //                 fontWeight: FontWeight.w500),
                  //             icon: Icons.keyboard_arrow_down,
                  //           ),
                  //         ),
                  //         const VerticalDivider(),
                  //         Expanded(
                  //           flex: 2,
                  //           child: TextCustom(
                  //             "Sắp xếp",
                  //             textAlign: TextAlign.center,
                  //             style: const TextStyle(
                  //                 fontWeight: FontWeight.w500),
                  //             icon: Icons.keyboard_arrow_down,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              child:SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(Utils.width(5)),
                  child: Obx(()=>ListView.builder(
                      itemCount: controller.listHotelData.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return itemHotelSearch(controller.listHotelData[index],callBack: (){
                          Get.toNamed(Routes.hotelInfo,arguments: controller.listHotelData[index]);
                        });
                      })),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
