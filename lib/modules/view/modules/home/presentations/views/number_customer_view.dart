import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/button_custom.dart';
import '../../../../../widget/text_custom.dart';
import '../../../../constant/app_colors.dart';
import '../controllers/home_controller.dart';

class NumberCustomerView extends GetView<HomeController>{

  @override
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(Utils.width(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Utils.width(10),
                  vertical: Utils.height(5),
                ),
                height: Utils.height(75),
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
                        "Khách",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Utils.width(20),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(),
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
                      itemNumberCustomer(
                          title: "Người lớn",
                          description: "6 tuổi trở lên",
                          value: controller.totalNumberCustomer,
                          decreaseCallBack: () {
                            controller.totalNumberCustomer.value--;
                          },
                          increaseCallBack: () {
                            controller.totalNumberCustomer.value++;
                          }),
                      itemNumberCustomer(
                          title: "Trẻ em",
                          description: "Dưới 6 tuổi",
                          min: 0,
                          value: controller.totalNumberCustomerChildren,
                          decreaseCallBack: () {
                            controller.totalNumberCustomerChildren.value--;
                          },
                          increaseCallBack: () {
                            controller.totalNumberCustomerChildren.value++;
                          }),
                      itemNumberCustomer(
                          title: "Số lượng phòng",
                          min: 1,
                          value: controller.totalNumberRoom,
                          isShowLastDivider: false,
                          decreaseCallBack: () {
                            controller.totalNumberRoom.value--;
                          },
                          increaseCallBack: () {
                            controller.totalNumberRoom.value++;
                          }),
                    ],
                  ),
                ),
              ),
              Container(
                height: Utils.width(50),
                width: Utils.width(180),
                alignment: Alignment.center,
                child: ButtonCustom(
                  text: 'Áp dụng',
                  onPress: (text) async {
                    Get.back();
                  },
                  style: TextStyle(
                      fontSize: Utils.width(20),
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  color: colorTitleAmber,
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemNumberCustomer(
      {String title = '',
      String description = '',
      int min = 0, RxInt? value,
      bool isShowLastDivider = true,
      Function()? decreaseCallBack,
      Function()? increaseCallBack}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: Utils.width(7)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(title.isNotEmpty)
                        TextCustom(
                          title,
                          style: TextStyle(
                            fontSize: Utils.width(17),
                            fontWeight: FontWeight.bold,
                            color: colorTextPrice,
                          ),
                        ),
                      if(description.isNotEmpty)
                        TextCustom(
                          description,
                          style: TextStyle(
                            fontSize: Utils.width(16),
                            color: colorTextPrice,
                          ),
                        ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(value!.value>min){
                            decreaseCallBack!();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: colorTextPrice),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: Utils.width(30),
                          width: Utils.width(30),
                          alignment: Alignment.center,
                          child:TextCustom(
                            "-",
                            callBack: (text){
                              if(value!.value>min){
                                decreaseCallBack!();
                              }
                            },
                            style: TextStyle(
                              fontSize: Utils.width(17),
                              fontWeight: FontWeight.bold,
                              color: colorTextPrice,
                            ),
                          ),
                        ),
                      ),
                      Obx(()=>Container(
                        margin: EdgeInsets.symmetric(horizontal: Utils.width(20)),
                        child: TextCustom(
                          value!.value.toString(),
                          style: TextStyle(
                            fontSize: Utils.width(20),
                            fontWeight: FontWeight.bold,
                            color: colorTextPrice,
                          ),
                        ),
                      ),),
                      GestureDetector(
                        onTap: () {
                          increaseCallBack!();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: colorTextPrice),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: Utils.width(30),
                          width: Utils.width(30),
                          alignment: Alignment.center,
                          child:TextCustom(
                            "+",
                            callBack: (text){
                              increaseCallBack!();
                            },
                            style: TextStyle(
                              fontSize: Utils.width(17),
                              fontWeight: FontWeight.bold,
                              color: colorTextPrice,
                            ),
                          ),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ],
          ),
        ),
        SizedBox(height: Utils.width(7),),
        if(isShowLastDivider)
          const Divider(color: colorTextPrice,thickness: 0.5,),
        if(isShowLastDivider)
          SizedBox(height: Utils.width(7),),
      ],
    );
  }

}