import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_hcmute/core/utils/utils.dart';
import 'package:final_project_hcmute/modules/view/modules/hotel_info_module/presentations/controllers/hotel_info_controller.dart';
import 'package:final_project_hcmute/modules/widget/text_custom.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../../routers/page_routes.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_images.dart';
import '../../../search_hotel_module/presentations/views/component/overview_hotel_info.dart';
import 'component/item_hotel_search_view.dart';

class HotelInfoView extends GetView<HotelInfoController> {

  @override
  HotelInfoController controller = Get.find<HotelInfoController>();

  HotelInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorMainBackground,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Utils.height(250),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned.fill(
                      top: 0,
                      right: 0,
                      left: 0,
                      bottom: Utils.width(50),
                      child: CarouselSlider(
                          items: controller.hotelData.hotelPhotos.split(";").map((value) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Image.network(
                                  value==''?icHoChiMinhCity:value,
                                  scale: 1,
                                  fit: BoxFit.cover,
                                );
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0,
                            scrollDirection: Axis.horizontal,
                          ))),
                  Positioned.fill(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: Utils.width(50),
                    child: Container(
                      color: Colors.black26,
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
                                    borderRadius:
                                        BorderRadius.circular(Utils.width(30))),
                                child: const Icon(Icons.arrow_back_ios_new),
                              ),
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.home);
                              },
                              child: Container(
                                padding: EdgeInsets.all(Utils.width(5)),
                                decoration: BoxDecoration(
                                    color: colorButtonCart.withOpacity(0.7),
                                    borderRadius:
                                        BorderRadius.circular(Utils.width(30))),
                                child: const Icon(Icons.manage_search_rounded),
                              ),
                            ),
                            SizedBox(
                              width: Utils.width(5),
                            ),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.offAndToNamed(Routes.home,arguments: true);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(Utils.width(5)),
                                    decoration: BoxDecoration(
                                        color: colorButtonCart.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(
                                            Utils.width(30))),
                                    child:
                                        const Icon(Icons.shopping_cart_rounded),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Obx(()=>Visibility(
                                    visible: controller.totalCart.value > 0,
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
                  // Positioned(
                  //   right: 0,
                  //   top: Utils.height(88),
                  //   child: Container(
                  //     padding: EdgeInsets.all(Utils.width(10)),
                  //     child: GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         padding: EdgeInsets.all(Utils.width(5)),
                  //         decoration: BoxDecoration(
                  //             color: colorButtonCart.withOpacity(0.7),
                  //             borderRadius:
                  //                 BorderRadius.circular(Utils.width(30))),
                  //         child: const Icon(Icons.image),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    left: Utils.width(10),
                    right: Utils.width(10),
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      height: Utils.height(125),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Utils.width(10),
                          ),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(Utils.width(2)),
                            child: TextCustom(
                              controller.hotelData.name,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: Utils.width(17),
                                fontWeight: FontWeight.bold,
                                color: colorTextPrice,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(Utils.width(2)),
                                  child: TextCustom(
                                    controller.hotelData.rawAddress,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: Utils.width(15),
                                      color: colorTextPrice,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Utils.width(5),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.location_on_sharp,
                                  size: Utils.width(40),
                                  color: colorTitleAmber,
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(Utils.width(2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(controller.hotelData.rating>=1)
                                  const Icon(Icons.star,
                                      color: colorRatingStar),
                                if(controller.hotelData.rating>=2)
                                  const Icon(Icons.star,
                                      color: colorRatingStar),
                                if(controller.hotelData.rating>=3)
                                  const Icon(Icons.star,
                                      color: colorRatingStar),
                                if(controller.hotelData.rating>=4)
                                  const Icon(Icons.star,
                                      color: colorRatingStar),
                                if(controller.hotelData.rating>=5)
                                  const Icon(Icons.star,
                                      color: colorRatingStar),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    overviewHotelInfo(content: controller.hotelData.overview),
                    Container(
                      margin: EdgeInsets.all(Utils.width(10)),
                      child: TextCustom(
                        "Danh sách phòng",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: Utils.width(20),
                          fontWeight: FontWeight.bold,
                          color: colorTextPrice,
                        ),
                      ),
                    ),
                    Obx(
                      () => ListView.builder(
                          itemCount: controller.listRoomTypeData.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return itemHotelRoom(
                                context, controller.listRoomTypeData[index]);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
