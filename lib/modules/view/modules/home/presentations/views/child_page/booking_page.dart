import 'package:final_project_hcmute/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../routers/page_routes.dart';
import '../../../../../../widget/text_custom.dart';
import '../../../../../constant/app_colors.dart';
import '../../../../payment_module/domain/entities/payment_model.dart';
import '../../controllers/home_controller.dart';

Widget myBooking(BuildContext context) {
  HomeController controller = Get.find<HomeController>();
  return Container(
    margin: EdgeInsets.all(Utils.width(10)),
    child: Obx(()=>ListView.builder(
        itemCount: controller.listPayment.length,
        itemBuilder: (context, index) {
          return _itemMyBooking(controller.listPayment[index]);
        })),
  );
}

Widget _itemMyBooking(PaymentModel paymentData) {
  HomeController controller = Get.find<HomeController>();
  return Container(
    margin: EdgeInsets.all(Utils.width(5)),
    padding: EdgeInsets.all(Utils.width(15)),
    decoration: BoxDecoration(
      color: colorCartItemBackground,
      borderRadius: BorderRadius.circular(Utils.width(5)),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(2, 8), // Shadow position
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCustom(
          paymentData.hotel.name,
          style: TextStyle(
            fontSize: Utils.width(16),
            fontWeight: FontWeight.bold,
            color: colorTextPrice,
          ),
        ),
        SizedBox(
          height: Utils.width(5),
        ),
        TextCustom(
          paymentData.hotel.rawAddress,
          style: TextStyle(
            fontSize: Utils.width(14),
            color: colorTextPrice,
          ),
        ),
        SizedBox(
          height: Utils.width(5),
        ),
        const Divider(),
        SizedBox(
          height: Utils.width(5),
        ),
        TextCustom(
          paymentData.roomType.name,
          style: TextStyle(
            fontSize: Utils.width(13),
            fontWeight: FontWeight.bold,
            color: colorTextPrice,
          ),
        ),
        SizedBox(
          height: Utils.width(5),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.calendar_today_outlined,size: Utils.width(16),),
            SizedBox(
              width: Utils.width(5),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ngày đến",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: Utils.width(10)),
                ),
                Text(
                  controller.calculateDayRatePackage(controller.format
                      .parse(paymentData.startAt.toString()))
                      .toString(),
                  style: TextStyle(
                    color: colorTextPrice,
                    fontWeight: FontWeight.w500,
                    fontSize: Utils.width(12),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Utils.width(7),
            ),
            Icon(Icons.calendar_today_outlined,size: Utils.width(16),),
            SizedBox(
              width: Utils.width(5),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ngày đi",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: Utils.width(10)),
                ),
                Text(
                  controller.calculateDayRatePackage(controller.format
                      .parse(paymentData.endAt.toString()))
                      .toString(),
                  style: TextStyle(
                    color: colorTextPrice,
                    fontWeight: FontWeight.w500,
                    fontSize: Utils.width(12),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Utils.width(7),
            ),
            Icon(Icons.emoji_people_rounded,size: Utils.width(20),),
            SizedBox(
              width: Utils.width(5),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Khách",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: Utils.width(10)),
                ),
                Text(
                  "${paymentData.paymentDetails.first.adultNum} Khách",
                  style: TextStyle(
                    color: colorTextPrice,
                    fontWeight: FontWeight.w500,
                    fontSize: Utils.width(12),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: Utils.width(10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextCustom(
              "Xem chi tiết",
              callBack: (text){
                Get.toNamed(Routes.bookingDetail,arguments: paymentData);
              },
              textAlign: TextAlign.end,
              style: TextStyle(
                color: colorTextPrice,
                fontWeight: FontWeight.bold,
                fontSize: Utils.width(15),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
