
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/models/hotel_details_model.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../routers/page_routes.dart';
import '../../../../../../widget/button_custom.dart';
import '../../../../../../widget/text_custom.dart';
import '../../../../../constant/app_colors.dart';
import '../../controllers/hotel_info_controller.dart';

Widget itemRateplanView(BuildContext context,RoomType data,RatePlan dataRatePlan){
  HotelInfoController controller = Get.find<HotelInfoController>();
  calculateTotalPriceItemRatePlan(controller, data, dataRatePlan);
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(Utils.width(10)),
              child: TextCustom(
                "${data.name} - ${dataRatePlan.name}",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: Utils.width(15),
                  fontWeight: FontWeight.bold,
                  color: colorTextPrice,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Utils.width(20),
              right: Utils.width(20),
            ),
            padding: EdgeInsets.all(Utils.width(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: colorTitleAmber,
                  style: BorderStyle.solid,
                  width: 0.80),
            ),
            alignment: Alignment.center,
            child: Text(
              "${controller.totalNumberRoom} Phòng",
              style: const TextStyle(
                  color: colorTitleAmber, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      if(dataRatePlan.freeBreakfast)
        _itemRateplanDetail("Được ăn sáng"),
      if(dataRatePlan.freeLunch)
        _itemRateplanDetail("Được ăn trưa"),
      if(dataRatePlan.freeDinner)
        _itemRateplanDetail("Được ăn tối"),
      Container(
        margin: EdgeInsets.only(top: Utils.width(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: Utils.width(5)),
              width: Utils.width(140),
              height: Utils.width(46),
              child: ButtonCustom(
                text: 'Thêm vào giỏ hàng',
                alignment: TextAlign.center,
                onPress: (text) {
                  controller.addToCart(data,dataRatePlan);
                },
                style: TextStyle(
                    fontSize: Utils.width(15),
                    color: colorTitleAmber),
                color: Colors.white,
                borderColor: colorTitleAmber,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Utils.width(5)),
              width: Utils.width(140),
              height: Utils.width(46),
              child: ButtonCustom(
                text: 'Đặt ngay',
                alignment: TextAlign.center,
                onPress: (text) {
                  Get.toNamed(Routes.payment);
                },
                style: TextStyle(
                    fontSize: Utils.width(15),
                    color: Colors.white),
                color: colorTitleAmber,
                borderColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
      Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(Utils.width(10)),
                child: TextCustom(
                  "Giá trung bình 1 đêm",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Utils.width(12),
                    fontWeight: FontWeight.bold,
                    color: colorTextPrice,
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Container(
              //       margin: EdgeInsets.only(left: Utils.width(10)),
              //       child:TextCustom(
              //         "20000 VND",
              //         style: TextStyle(
              //             color: colorTextPrice,
              //             fontWeight: FontWeight.w600,
              //             fontSize: Utils.width(15),decoration: TextDecoration.lineThrough),
              //       ),
              //     ),
              //     Expanded(
              //       child: Container(
              //         margin: EdgeInsets.only(left: Utils.width(5)),
              //         child: TextCustom(
              //           "- 10%",
              //           style: TextStyle(
              //               color: appBarColor,
              //               fontWeight: FontWeight.w600,
              //               fontSize: Utils.width(12)),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
                child: TextCustom(//${data.ratePlans.first.ratePackages.first.price}
                  "${controller.calculateAveragePriceRatePlan(dataRatePlan)} VND",
                  style: TextStyle(
                      color: colorPriceRoom,
                      fontWeight: FontWeight.w600,
                      fontSize: Utils.width(20)),
                ),
              ),
            ],
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(top: Utils.height(40)),
              child: ExpansionTile(
                // tilePadding: EdgeInsets.only(bottom: 0),
                title: TextCustom(
                  "Xem chi tiết",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: Utils.width(15),
                    fontWeight: FontWeight.bold,
                    color: colorTextPrice,
                  ),
                ),
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
                    child: const Divider(),
                  ),
                  Obx(()=>ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.totalDays.value,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        try{
                          var tempRatePackagePrice = dataRatePlan.ratePackages
                                .where((element) {
                                  debugPrint(controller.format.parse(element
                                      .availabilityAt
                                      .toUtc()
                                      .toIso8601String()).toString());
                                  debugPrint(controller.startDateTime
                                      .add(Duration(days: index)).toString());
                                  return controller.format.parse(element
                                          .availabilityAt
                                          .toUtc()
                                          .toIso8601String()) ==
                                      controller.startDateTime
                                          .add(Duration(days: index));
                                })
                                .first
                                .price;
                            dataRatePlan.totalPrice += tempRatePackagePrice;
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: Utils.width(10),
                                vertical: Utils.width(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextCustom(
                                  controller.calculateDayRatePackage(controller.startDateTime.add(Duration(days: index))),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: Utils.width(15),
                                    fontWeight: FontWeight.bold,
                                    color: colorTextPrice,
                                  ),
                                ),
                                Expanded(child: Container()),
                                // Column(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     TextCustom(
                                //       "- 10%",
                                //       style: TextStyle(
                                //           color: appBarColor,
                                //           fontWeight: FontWeight.w600,
                                //           fontSize: Utils.width(10)),
                                //     ),
                                //     TextCustom(
                                //       "20000 VND",
                                //       style: TextStyle(
                                //           color: colorTextPrice,
                                //           fontWeight: FontWeight.w600,
                                //           fontSize: Utils.width(10),
                                //           decoration: TextDecoration.lineThrough),
                                //     ),
                                //   ],
                                // ),
                                SizedBox(
                                  width: Utils.width(5),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Utils.width(10)),
                                  child: TextCustom(
                                    "$tempRatePackagePrice VND",
                                    style: TextStyle(
                                        color: colorPriceRoom,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Utils.width(15)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }catch(e){
                          debugPrint(e.toString());
                          return Container();
                        }
                      }),),
                ],
              ),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
        child: const Divider(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(Utils.width(10)),
            child: TextCustom(
              "Tổng tiền",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Utils.width(17),
                fontWeight: FontWeight.bold,
                color: colorTextPrice,
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.all(Utils.width(10)),
            child: TextCustom(
              "${dataRatePlan.totalPrice} VND",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Utils.width(20),
                fontWeight: FontWeight.bold,
                color: appBarColor,
              ),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
        child: const Divider(),
      ),
    ],
  );
}

calculateTotalPriceItemRatePlan(HotelInfoController controller,RoomType data,RatePlan dataRatePlan){
  dataRatePlan.totalPrice = 0;
  for(int index=0;index<controller.totalDays.value;index++){
    try{
      var tempRatePackagePrice = dataRatePlan.ratePackages
          .where((element) {
        debugPrint(controller.format.parse(element
            .availabilityAt
            .toUtc()
            .toIso8601String()).toString());
        debugPrint(controller.startDateTime
            .add(Duration(days: index)).toString());
        return controller.format.parse(element
            .availabilityAt
            .toUtc()
            .toIso8601String()) ==
            controller.startDateTime
                .add(Duration(days: index));
      })
          .first
          .price;
      dataRatePlan.totalPrice += tempRatePackagePrice;
    }catch(e){
      dataRatePlan.totalPrice += 0;
    }
    dataRatePlan.totalPrice *= controller.totalNumberRoom.value;
  }

}

Widget _itemRateplanDetail(dynamic data){
  return Container(
    margin: EdgeInsets.all(Utils.width(5)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: Utils.width(5)),
          child: Icon(
            Icons.check,
            color: colorTextPrice,
            size: Utils.width(25),
          ),
        ),
        Expanded(
          child: TextCustom(
            data,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Utils.width(15),
              color: colorTextPrice,
            ),
          ),
        ),
      ],
    ),
  );
}