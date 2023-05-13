import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/models/hotel_details_model.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../routers/page_routes.dart';
import '../../../../../../widget/button_custom.dart';
import '../../../../../../widget/text_custom.dart';
import '../../../../../constant/app_colors.dart';
import '../../controllers/hotel_info_controller.dart';
import 'image_view_component.dart';
import 'item_rateplan_view.dart';

Widget itemHotelRoom(BuildContext context, RoomType data) {
  HotelInfoController controller = Get.find<HotelInfoController>();
  return Stack(
    children: [
      Container(
        margin: EdgeInsets.all(Utils.width(10)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Utils.width(10)),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(Utils.width(10)),
              child: TextCustom(
                data.name,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: Utils.width(15),
                  fontWeight: FontWeight.bold,
                  color: colorTextPrice,
                ),
              ),
            ),
            imageViewWidget(data.photos.split(";")),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Utils.width(15)),
              height: Utils.width(46),
              child: ButtonCustom(
                text: 'Xem chi tiết',
                onPress: (text) {
                  Get.toNamed(Routes.roomDetail,arguments: data);
                },
                style: TextStyle(
                    fontSize: Utils.width(20),
                    fontWeight: FontWeight.bold,
                    color: colorTitleAmber),
                color: Colors.white,
                borderColor: colorTitleAmber,
              ),
            ),
            ListView.builder(
              itemCount:data.ratePlans.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
                if(controller.calculateAveragePriceRatePlan(data.ratePlans[index])>0.0){
                  return itemRateplanView(context, data,data.ratePlans[index]);
                }else{
                  return Container();
                }
              }
            ),

          ],
        ),
      ),
    ],
  );
}
