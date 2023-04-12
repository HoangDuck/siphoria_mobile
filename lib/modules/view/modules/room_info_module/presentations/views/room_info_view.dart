import 'package:final_project_hcmute/modules/view/constant/app_images.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/button_custom.dart';
import '../../../../../widget/text_custom.dart';
import '../../../../constant/app_colors.dart';
import '../controllers/room_info_controller.dart';

class RoomInfoView extends GetView<RoomInfoController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(Utils.width(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Utils.width(10),
                  vertical: Utils.height(5),
                ),
                height: Utils.height(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    Expanded(
                      child: TextCustom(
                        "Chi tiết phòng",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Utils.width(20),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container()
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(Utils.width(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustom(
                          "Executive Suites",
                          style: TextStyle(
                            color: colorTextPrice,
                            fontWeight: FontWeight.bold,
                            fontSize: Utils.width(25),
                          ),
                        ),
                        SizedBox(height: Utils.width(10),),
                        TextCustom(
                          "1 giường Queen. Kích thước phòng 15 m2 / 161 ft2. Quang cảnh ngoài trời. Vòi hoa sen. Wifi miễn phí",
                          style: TextStyle(
                            color: colorTextPrice,
                            fontSize: Utils.width(15),
                          ),
                        ),
                        SizedBox(height: Utils.width(15),),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: Utils.height(250),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Utils.width(10)),
                            child: Image.network(
                              icHoChiMinhCity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Utils.width(60),
                          child: ListView.builder(
                            itemCount: 5,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){

                                },
                                child: Container(
                                  padding: EdgeInsets.all(Utils.width(5)),
                                  height: Utils.width(50),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Utils.width(10)),
                                    child: Image.network(
                                      icHoChiMinhCity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: Utils.width(10),),
                        TextCustom(
                          "Tiện ích phòng tắm",
                          style: TextStyle(
                            color: colorTextPrice,
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.width(18),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return _itemRateplanDetail("1");
                            }),
                        SizedBox(height: Utils.width(10),),
                        TextCustom(
                          "Tiện ích phòng",
                          style: TextStyle(
                            color: colorTextPrice,
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.width(18),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return _itemRateplanDetail("1");
                            }),
                        SizedBox(height: Utils.width(10),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
              Icons.airport_shuttle_rounded,
              color: colorTitleAmber,
              size: Utils.width(25),
            ),
          ),
          Expanded(
            child: TextCustom(
              "6 người lớn, 3 trẻ em",
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

}