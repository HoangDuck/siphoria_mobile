import 'package:final_project_hcmute/modules/view/modules/payment_module/presentations/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../widget/button_custom.dart';
import '../../../../../widget/custom_dialog.dart';
import '../../../../../widget/text_custom.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_images.dart';
import '../../domain/entities/payment_model.dart';

class PaymentView extends GetView<PaymentController>{

  @override
  PaymentController controller = Get.find<PaymentController>();

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
                "Thanh toán",
                style: TextStyle(
                    fontSize: Utils.width(30), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child:  _listItemCart(context),
            ),
          ),
          Container(
            height: Utils.height(110),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.all(Utils.width(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          child: TextCustom(
                            "Tổng cộng:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Utils.height(17)),
                          )),
                      TextCustom(
                        "${controller.totalCostPayment.value} VND",
                        style: TextStyle(
                            color: colorTitleAmber,
                            fontWeight: FontWeight.bold,
                            fontSize: Utils.height(25)),
                      )
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      height: Utils.height(20),
                    ),
                  ),
                  ButtonCustom(
                    text: "Thanh toán",
                    onPress: (_) async {
                      showLoadingDialog(context);
                      await controller.paymentWithMomo().then((){
                        Get.back();
                      });
                    },
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Utils.width(25),
                        fontWeight: FontWeight.bold),
                    height: Utils.height(45),
                    color: colorTitleAmber,
                    borderColor: Colors.transparent,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _listItemCart(BuildContext context){
    return Container(
      margin: EdgeInsets.all(Utils.width(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Utils.width(30)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(()=>ListView.builder(
              itemCount: controller.listHotelPayment.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, indexHotel) {
                return Container(
                  decoration: BoxDecoration(
                    color: colorCartItemBackground,
                    borderRadius: BorderRadius.circular(Utils.width(5)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      initiallyExpanded:true,
                      maintainState: true,
                      // tilePadding: EdgeInsets.only(bottom: 0),
                      title: TextCustom(
                        controller.listHotelPayment[indexHotel].toString().split("#").last,
                        style: TextStyle(
                          fontSize: Utils.width(15),
                          fontWeight: FontWeight.bold,
                          color: colorTextPrice,
                        ),
                      ),
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
                          child: const Divider(color: Colors.black26,),
                        ),
                        listPaymentItem(
                            context,
                            controller.listPayment
                                .where((p0) =>
                            p0.hotelId ==
                                controller.listHotelPayment[indexHotel].toString().split("#").first,)
                                .toList()),

                      ],
                    ),
                  ),
                );
              })),
          Container(
            margin: EdgeInsets.only(top: Utils.width(20),bottom: Utils.width(10)),
            child: TextCustom(
              "Chọn phương thức thanh toán",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: Utils.width(17),
                fontWeight: FontWeight.bold,
                color: colorTextPrice,
              ),
            ),
          ),
          Obx(
                () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listPaymentMethod.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    controller.listPaymentMethod.forEach((element) {
                      element['isCheck']=false;
                    });
                    controller.listPaymentMethod[index]['isCheck']=true;
                    controller.listPaymentMethod.refresh();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: Utils.width(3)),
                    padding: EdgeInsets.all(Utils.width(10)),
                    decoration: BoxDecoration(
                      color: controller.listPaymentMethod[index]['background'],
                      border: Border.all(
                          color: controller.listPaymentMethod[index]
                          ['isCheck']
                              ? controller.listPaymentMethod[index]['color']
                              : Colors.transparent,width: 2),
                      borderRadius: BorderRadius.circular(Utils.width(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          controller.listPaymentMethod[index]['image'],
                          scale: 1.5,
                          width: Utils.width(50),
                          height: Utils.width(50),
                        ),
                        SizedBox(width: Utils.width(10),),
                        Expanded(
                          child: TextCustom(
                            controller.listPaymentMethod[index]['key'],
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: Utils.width(17),
                              fontWeight: FontWeight.bold,
                              color: colorTextPrice,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listPaymentItem(BuildContext context,List<PaymentModel> listPayment){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: listPayment.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.symmetric(vertical: Utils.width(10),horizontal: Utils.width(10)),
                padding: EdgeInsets.symmetric(vertical: Utils.width(10),horizontal: Utils.width(10)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: colorTextPrice.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(Utils.width(5)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextCustom(
                          listPayment[index].roomType.name,
                          style: TextStyle(
                            fontSize: Utils.width(15),
                            fontWeight: FontWeight.bold,
                            color: colorTextPrice,
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: Utils.width(10)),
                      child: const Divider(color: Colors.black26,),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: listPayment[index].paymentDetails.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index2) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: Utils.width(10),
                                vertical: Utils.width(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(Utils.width(5)),
                                  child: Image.network(icImageHotelIntro,scale: 50,),
                                ),
                                SizedBox(width: Utils.width(5),),
                                TextCustom(
                                  Utils.convertDateTimeDDMMYYYY(
                                      listPayment[index].paymentDetails[index2].dayOff),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: Utils.width(12),
                                    fontWeight: FontWeight.bold,
                                    color: colorTextPrice,
                                  ),
                                ),
                                Expanded(child: Container()),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Utils.width(10)),
                                  child: TextCustom(
                                    "${listPayment[index].paymentDetails[index2].price} VND",
                                    style: TextStyle(
                                        color: colorTextPrice,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Utils.width(15)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                    for (var k in listPayment[index].ratePlan.toJson().keys) ...{
                      if(listPayment[index].ratePlan.toJson()[k].toString()=='true'&& k !='activate')
                        _itemRateplanDetail(k),
                    },
                    // ListView.builder(
                    //     shrinkWrap: true,
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     itemCount: 3,
                    //     itemBuilder: (context, index) {
                    //       return _itemRateplanDetail("1");
                    //     }),
                  ],
                ),
              );
            }),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              vertical: Utils.width(10), horizontal: Utils.width(10)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Utils.width(5)),
                bottomRight: Radius.circular(Utils.width(5))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextCustom(
                "Tổng giá phòng",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: Utils.width(17),
                  fontWeight: FontWeight.bold,
                  color: colorTextPrice,
                ),
              ),
              Expanded(child: Container()),
              TextCustom(
                "${controller.calculateTotalCostPerHotel(listPayment)} VND",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: Utils.width(20),
                  fontWeight: FontWeight.bold,
                  color: appBarColor,
                ),
              ),
            ],
          ),
        ),
      ],
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