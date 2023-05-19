import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/local_storage.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../routers/page_routes.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_images.dart';
import '../../../home/presentations/controllers/home_controller.dart';
import '../../domain/adapters/repository_adapter.dart';
import '../../domain/entities/payment_model.dart';
// import 'package:momo_vn/momo_vn.dart';

class PaymentController extends GetxController{
  final IPaymentRepository paymentRepository;

  PaymentController({required this.paymentRepository});
  RxList<dynamic> listPaymentMethod = [
    {
      'key':'Momo',
      'isCheck':true,
      'image':icMomo,
      'color':colorBorderMomo,
      'background':colorBackgroundMomo,
    },
    // {
    //   'key':'VNPay',
    //   'isCheck':false,
    //   'image':icPaypal,
    //   'color': colorBorderVNPay,
    //   'background':colorBackgroundVNPay,
    // }
  ].obs;

  RxList<PaymentModel> listPayment = <PaymentModel>[].obs;
  RxDouble totalCostPayment = 0.0.obs;
  RxList<String> listHotelPayment = <String>[].obs;

  HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    getListPayment();
  }

  getListPayment() async {
    listPayment.clear();
    try{
      var listPaymentModel = await paymentRepository.getListPayment();
      if(listPaymentModel.isNotEmpty){
        for(var element in listPaymentModel){
          totalCostPayment.value += element.totalPrice;
        }
        listPayment.addAll(listPaymentModel);
        listPayment.refresh();
        for (var element in listPaymentModel) {
          listHotelPayment.add('${element.hotel.id}#${element.hotel.name}');
        }
        var tempNewHotelList = listHotelPayment.toSet().toList();
        listHotelPayment.clear();
        listHotelPayment.addAll(tempNewHotelList);
        listHotelPayment.refresh();
      }
    }catch(e){
      SecureStorage secureStorage = SecureStorage();
      secureStorage.deleteAccessToken();
      secureStorage.deleteRefreshToken();
      Get.offAndToNamed(Routes.authentication);
    }
  }

  calculateTotalCostPerHotel(List<PaymentModel> listPayment){
    var totalCost = 0;
    for(var element in listPayment){
      totalCost += element.price;
    }
    return totalCost;
  }

  paymentWithMomo() async {
    var result = await Utils.platform.invokeMethod('openMomo', {
      "value":
      "${totalCostPayment.value};${listPayment.first.sessionId};${_getDescriptionPaymentInfo()}"
    });
    if(result=="Successful"){
      var result = await paymentRepository.updatePayment(listPayment.first.sessionId);
      listPayment.clear();
      listHotelPayment.clear();
      totalCostPayment.value = 0.0;
      listPayment.refresh();
      listHotelPayment.refresh();
      Get.snackbar(
        "Siphoria", "Thanh toán thành công",
        icon: const Icon(Icons.person, color: Colors.white),
        backgroundColor: colorPriceRoom,
        snackPosition: SnackPosition.TOP,
      );
      Get.delete<HomeController>();
      Get.toNamed(Routes.home);
    }else{
      Get.snackbar(
        "Siphoria", "Thanh toán thất bại",
        icon: const Icon(Icons.person, color: Colors.white),
        backgroundColor: colorRatingStar,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  _getDescriptionPaymentInfo(){
    var tempStringRoomName = '';
    for(var element in listPayment){
      tempStringRoomName+=', ${element.roomType.name}';
    }
    return "Thanh toán phòng $tempStringRoomName";
  }

}