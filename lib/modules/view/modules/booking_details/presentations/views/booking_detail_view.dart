
import 'package:final_project_hcmute/modules/view/constant/app_images.dart';
import 'package:final_project_hcmute/modules/view/modules/booking_details/presentations/controllers/booking_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/button_custom.dart';
import '../../../../../widget/text_custom.dart';
import '../../../../constant/app_colors.dart';
import '../../../payment_module/domain/entities/payment_model.dart';

class BookingDetailView extends GetView<BookingDetailController>{
  @override
  BookingDetailController controller = Get.find<BookingDetailController>();


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
                    controller.paymentData.hotel.name,
                    style: TextStyle(
                        fontSize: Utils.width(7)),
                  ),
                  Text(
                    controller.paymentData.roomType.name,
                    style: TextStyle(
                        fontSize: Utils.width(15), fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${controller.calculateDayRatePackage(controller.format
                        .parse(controller.paymentData.startAt.toString()))
                        .toString()} - ${controller.calculateDayRatePackage(controller.format
                        .parse(controller.paymentData.endAt.toString()))
                        .toString()} | ${controller.paymentData.paymentDetails.first.adultNum} khách",
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
      body: SingleChildScrollView(
        child: Container(
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
              if(controller.paymentData.status=="paid")
                SizedBox(
                  // margin: EdgeInsets.symmetric(horizontal: Utils.width(15)),
                  height: Utils.width(46),
                  width: MediaQuery.of(context).size.width,
                  child: ButtonCustom(
                    text: 'Hủy',
                    onPress: (text) {},
                    style: TextStyle(
                        fontSize: Utils.width(20),
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    color: colorTitleAmber,
                    borderColor: Colors.transparent,
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
                            controller.paymentData.hotel.name,
                            style: TextStyle(
                              color: colorTextPrice,
                              fontWeight: FontWeight.w500,
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
                        const Icon(Icons.location_on_rounded),
                        SizedBox(width: Utils.width(10),),
                        Expanded(
                          child: TextCustom(
                            controller.paymentData.hotel.rawAddress,
                            style: TextStyle(
                              color: colorTextPrice,
                              fontWeight: FontWeight.w500,
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
                        const Icon(Icons.stars),
                        SizedBox(width: Utils.width(10),),
                        Expanded(
                          child: TextCustom(
                            controller.paymentData.hotel.rating.toString(),
                            style: TextStyle(
                              color: colorTextPrice,
                              fontWeight: FontWeight.w500,
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextCustom(
                            "Giá (${controller.paymentData.paymentDetails.length} đêm)",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: Utils.width(16),
                            ),
                          ),
                          Expanded(child: Container(),),
                          TextCustom(
                            "${controller.paymentData.totalPrice} VND",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: Utils.width(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextCustom(
                            "Phí dịch vụ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: Utils.width(16),
                            ),
                          ),
                          Expanded(child: Container(),),
                          TextCustom(
                            "0 VND",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: Utils.width(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextCustom(
                            "Tổng cộng",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: Utils.width(16),
                            ),
                          ),
                          Expanded(child: Container(),),
                          TextCustom(
                            "${controller.paymentData.totalPrice} VND",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: Utils.width(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Utils.width(10),)
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
              ListView.builder(
                  itemCount: controller.paymentData.paymentDetails.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _itemRoomNight(context,controller.paymentData.paymentDetails[index]);
                  }),

            ],
          ),
        ),
      ),
    );
  }

  Widget _itemRoomNight(BuildContext context,PaymentDetail paymentDetailData){
    return Container(
      margin: EdgeInsets.symmetric(vertical: Utils.width(10)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Utils.width(5)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            // offset: Offset(2, 4), // Shadow position
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Utils.width(5)),
            child: Image.network(
              controller.paymentData.roomType.photos.split(";").first,
              height: Utils.height(160),
              width: MediaQuery.of(context).size.width,
              scale: 1.5,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: Utils.width(10),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(7)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.meeting_room,size: Utils.width(25),),
                TextCustom(
                  "Phòng",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: Utils.width(16),
                  ),
                ),
                Expanded(child: Container(),),
                TextCustom(
                  controller.paymentData.roomType.name,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: Utils.width(16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(7)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.family_restroom,size: Utils.width(25),),
                TextCustom(
                  "Khách",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: Utils.width(16),
                  ),
                ),
                Expanded(child: Container(),),
                TextCustom(
                  "${paymentDetailData.adultNum} Người lớn",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: Utils.width(16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(7)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.calendar_month,size: Utils.width(25),),
                TextCustom(
                  "Ngày",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: Utils.width(16),
                  ),
                ),
                Expanded(child: Container(),),
                TextCustom(
                  controller.calculateDayRatePackage(controller.format
                      .parse(paymentDetailData.dayOff.toString()))
                      .toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: Utils.width(16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Utils.width(15),vertical: Utils.width(7)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.monetization_on,size: Utils.width(25),),
                TextCustom(
                  "Giá",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: Utils.width(16),
                  ),
                ),
                Expanded(child: Container(),),
                TextCustom(
                  "${paymentDetailData.price} VND",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: Utils.width(16),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Utils.width(10),),
        ],
      ),
    );
  }
}