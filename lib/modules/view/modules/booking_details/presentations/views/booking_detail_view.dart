
import 'package:final_project_hcmute/modules/view/constant/app_images.dart';
import 'package:final_project_hcmute/modules/view/modules/booking_details/presentations/controllers/booking_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/text_custom.dart';
import '../../../../constant/app_colors.dart';

class BookingDetailView extends GetView<BookingDetailController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBarColor,
        shadowColor: Colors.white,
        title: Container(
          height: Utils.width(40),
          alignment: Alignment.center,
          child: Row(
            children: [
              SizedBox(width: Utils.width(12),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Cam Ranh Rivera Beach Resort",
                    style: TextStyle(
                        fontSize: Utils.width(7)),
                  ),
                  Text(
                    "1 Delux Room With Pool View",
                    style: TextStyle(
                        fontSize: Utils.width(15), fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "03 - 06 Thg 5, 2023 | 2 khách",
                    style: TextStyle(
                      fontSize: Utils.width(7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(Utils.width(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustom(
              "Đặt phòng của tôi",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: colorTextPrice,
                fontWeight: FontWeight.bold,
                fontSize: Utils.width(20),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Utils.width(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextCustom(
                    "Booking ID",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: colorTextPrice,
                      fontSize: Utils.width(17),
                    ),
                  ),
                  SizedBox(width: Utils.width(15),),
                  TextCustom(
                    "123456789",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: appBarColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Utils.width(17),
                    ),
                  ),
                  SizedBox(width: Utils.width(5),),
                  GestureDetector(
                    onTap: (){},
                    child: const Icon(Icons.content_copy_rounded),

                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            const Divider(),
            TextCustom(
              "Thông tin liên hệ",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: colorTextPrice,
                fontWeight: FontWeight.bold,
                fontSize: Utils.width(20),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Utils.width(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on_rounded),
                      SizedBox(width: Utils.width(10),),
                      Expanded(
                        child: TextCustom(
                          "Khu phố 14, Bãi sau Mũi Né, Mũi Né, Phan Thiết, Việt Nam",
                          style: TextStyle(
                            color: colorTextPrice,
                            fontWeight: FontWeight.bold,
                            fontSize: Utils.width(16),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Utils.width(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.phone_iphone_rounded),
                      SizedBox(width: Utils.width(10),),
                      Expanded(
                        child: TextCustom(
                          "+84942768316",
                          style: TextStyle(
                            color: colorTextPrice,
                            fontWeight: FontWeight.bold,
                            fontSize: Utils.width(16),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Utils.width(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.email_rounded),
                      SizedBox(width: Utils.width(10),),
                      Expanded(
                        child: TextCustom(
                          "hoanghuuduc22@gmail.com",
                          style: TextStyle(
                            color: colorTextPrice,
                            fontWeight: FontWeight.bold,
                            fontSize: Utils.width(16),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            TextCustom(
              "Thông tin thanh toán",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: colorTextPrice,
                fontWeight: FontWeight.bold,
                fontSize: Utils.width(20),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Utils.width(10)),
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.credit_card_rounded),
                        SizedBox(
                          width: Utils.width(15),
                        ),
                        TextCustom(
                          "Phương thức thanh toán",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.width(16),
                          ),
                        ),
                        Expanded(child:Container(),),
                        Image.asset(
                          icMomo,
                          width: Utils.width(40),
                          height: Utils.width(40),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: Utils.width(3),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextCustom(
                        "Phương thức thanh toán",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: Utils.width(16),
                        ),
                      ),
                      Expanded(child: Container(),),
                      TextCustom(
                        "Phương thức thanh toán",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: Utils.width(16),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            TextCustom(
              "Tổng số đêm",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: colorTextPrice,
                fontWeight: FontWeight.bold,
                fontSize: Utils.width(20),
              ),
            ),
          ],
        ),
      ),
    );
  }

}