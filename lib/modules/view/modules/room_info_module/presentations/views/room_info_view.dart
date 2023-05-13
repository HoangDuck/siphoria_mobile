import 'package:final_project_hcmute/modules/view/constant/app_images.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/text_custom.dart';
import '../../../../constant/app_colors.dart';
import '../controllers/room_info_controller.dart';

class RoomInfoView extends GetView<RoomInfoController>{
  @override
  RoomInfoController controller = Get.find<RoomInfoController>();


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
                          controller.data.name,
                          style: TextStyle(
                            color: colorTextPrice,
                            fontWeight: FontWeight.bold,
                            fontSize: Utils.width(25),
                          ),
                        ),
                        SizedBox(height: Utils.width(10),),
                        TextCustom(
                          controller.data.description,
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
                              controller.data.photos.split(";").first,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Utils.width(60),
                          child: ListView.builder(
                            itemCount: controller.data.photos.split(";").length,
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
                                      controller.data.photos.split(";")[index],
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
                          "Phong cảnh",
                          style: TextStyle(
                            color: colorTextPrice,
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.width(18),
                          ),
                        ),
                        for (var k in controller.data.roomTypeViews.toJson().keys) ...{
                          if(controller.data.roomTypeViews.toJson()[k].toString()=='true')
                            _itemRateplanDetail(k),
                        },
                        SizedBox(height: Utils.width(10),),
                        TextCustom(
                          "Tiện ích phòng",
                          style: TextStyle(
                            color: colorTextPrice,
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.width(18),
                          ),
                        ),
                        for (var k in controller.data.roomTypeFacility.toJson().keys) ...{
                          if(controller.data.roomTypeFacility.toJson()[k].toString()=='true')
                            _itemRateplanDetail(k),
                        },
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

}