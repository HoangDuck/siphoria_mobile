import 'package:final_project_hcmute/modules/view/constant/app_images.dart';
import 'package:final_project_hcmute/modules/view/modules/history_booking/presentations/controllers/history_booking_controller.dart';
import 'package:final_project_hcmute/routers/page_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/text_custom.dart';
import '../../../../constant/app_colors.dart';

class HistoryBookingView extends GetView<HistoryBookingController> {
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
              Text(
                "Lịch sử đặt phòng",
                style: TextStyle(
                    fontSize: Utils.width(30), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(Utils.width(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextCustom(
                    "Danh sách lịch sử đặt phòng",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Utils.width(19),
                        color: colorTextPrice
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: (){
                //
                //   },
                //   child: const Icon(
                //     Icons.filter_alt_rounded,
                //     color: colorTextPrice,
                //   ),
                // )
              ],
            ),
          ),
          Expanded(
            child: Container(
            margin: EdgeInsets.all(Utils.width(10)),
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _itemHistoryBookingView();
                }),
          )
          ),
        ],
      ),
    );
  }

  Widget _itemHistoryBookingView(){
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.bookingDetail);
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorItemHistoryBooking,
          borderRadius: BorderRadius.circular(Utils.width(10)),
        ),
        margin: EdgeInsets.all(Utils.width(5)),
        padding: EdgeInsets.all(Utils.width(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Utils.width(10)),
              child: Image.network(
                icHoChiMinhCity,
                width: Utils.width(75),
                height: Utils.width(75),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(child: Container(
              margin: EdgeInsets.symmetric(horizontal:Utils.width(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    "03 Thg 03, 2023",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Utils.width(19),
                        color: colorTextPrice
                    ),
                  ),
                  TextCustom(
                    "Muine Bay Resort",
                    style: TextStyle(
                        fontSize: Utils.width(17),
                        color: colorTextPrice
                    ),
                  ),
                  TextCustom(
                    "Room Type: Standard",
                    style: TextStyle(
                        fontSize: Utils.width(13),
                        color: colorTextPrice
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: Utils.height(10)),
                    child: TextCustom(
                      "Đã đặt",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Utils.width(19),
                          color: colorTextPrice
                      ),
                    ),
                  ),
                  TextCustom(
                    "12 Thg 1, 2023, 4:29 am",
                    style: TextStyle(
                        fontSize: Utils.width(17),
                        color: colorTextPrice
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
