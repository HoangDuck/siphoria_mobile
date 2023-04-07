import 'package:final_project_hcmute/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widget/text_custom.dart';
import '../../../../../constant/app_colors.dart';
import '../../controllers/home_controller.dart';

Widget myBooking(BuildContext context) {
  HomeController controller = Get.find<HomeController>();
  return Container(
    margin: EdgeInsets.all(Utils.width(10)),
    child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return _itemMyBooking();
        }),
  );
}

Widget _itemMyBooking() {
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
          "The Shine 2 Hotel & Apartment",
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
          "Khu phố 14, Bãi sau Mũi Né, Phan Thiết, Việt Nam",
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
          "1 Delux Room with pool view",
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
            const Icon(Icons.calendar_today_outlined),
            SizedBox(
              width: Utils.width(10),
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
                  "Từ ngày",
                  style: TextStyle(
                    color: colorTextPrice,
                    fontWeight: FontWeight.w500,
                    fontSize: Utils.width(12),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Utils.width(10),
            ),
            const Icon(Icons.calendar_today_outlined),
            SizedBox(
              width: Utils.width(10),
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
                  "Đến ngày",
                  style: TextStyle(
                    color: colorTextPrice,
                    fontWeight: FontWeight.w500,
                    fontSize: Utils.width(12),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Utils.width(10),
            ),
            const Icon(Icons.emoji_people_rounded),
            SizedBox(
              width: Utils.width(10),
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
                  "2 Khách",
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
