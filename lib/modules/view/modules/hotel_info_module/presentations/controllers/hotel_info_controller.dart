import 'package:final_project_hcmute/core/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/models/hotel_details_model.dart';
import '../../../../../../core/models/hotel_model.dart';
import '../../../../../../routers/page_routes.dart';
import '../../../../constant/app_colors.dart';
import '../../../home/presentations/controllers/home_controller.dart';
import '../../domain/adapters/repository_adapter.dart';

class HotelInfoController extends GetxController{
  final IHotelInfoRepository hotelInfoRepository;
  HotelInfoController({required this.hotelInfoRepository});
  HomeController homeController = Get.find<HomeController>();
  RxInt totalCart = 0.obs;
  late Hotel hotelData;
  RxInt totalCustomer = 0.obs;
  RxInt totalNumberRoom= 1.obs;
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;
  late DateTime startDateTime;
  late DateTime endDateTime;
  RxList<int> listNumberRoom = [1].obs;
  RxList<RoomType> listRoomTypeData = <RoomType>[].obs;
  RxInt totalDays = 0.obs;

  final format = DateFormat('yyyy-MM-ddTHH:mm:ssZ','en-US');

  @override
  void onInit() {
    super.onInit();
    hotelData = Get.arguments;
    totalCart.value = homeController.totalNumberCartItem.value;
    totalNumberRoom.value = homeController.totalNumberRoom.value;
    startDateTime = homeController.startDate!;
    endDateTime = homeController.endDate!;
    totalDays.value = endDateTime.difference(startDateTime).inDays;
    getListRoomTypeHotelInfo();
  }

  getListRoomTypeHotelInfo() async {
    var listRoomType = await hotelInfoRepository.getListRoomTypeMobile(hotelData.id);
    listRoomTypeData.addAll(listRoomType);
    listRoomTypeData.refresh();
  }

  calculateAveragePriceRatePlan(RatePlan ratePlan){
    double price= 0.0;
    if(ratePlan.ratePackages.isEmpty){
      return 0.0;
    }
    for(int index=0;index<ratePlan.ratePackages.length;index++){
      price+=ratePlan.ratePackages[index].price??0.0;
    }
    price=price/ratePlan.ratePackages.length;
    return price;
  }

  calculateDayRatePackage(DateTime dateTime){
    return '${dateTime.day} Tháng ${dateTime.month}, ${dateTime.year}';
  }

  addToCart(RoomType data,RatePlan dataRatePlan) async {
    try{
      var result = await hotelInfoRepository.addToCart({
        'from_date': startDateTime
            .toString(),
        'to_date': endDateTime
            .toString(),
        'number_of_adults': homeController.totalNumberCustomer.value,
        'number_of_children': homeController.totalNumberCustomer.value,
        'number_of_rooms': totalNumberRoom.value,
        'rate_plan_id':dataRatePlan.id,
        'room_type_id':data.id,
        'hotel_id':data.hotelId
      });
      if(result){
        homeController.totalNumberCartItem.value++;
        totalCart.value++;
        Get.snackbar(
          "Giỏ hàng", "Thêm giỏ hàng thành công",
          icon: const Icon(Icons.person, color: Colors.white),
          backgroundColor: colorPriceRoom,
          snackPosition: SnackPosition.TOP,
        );
      }else{
        Get.snackbar(
          "Giỏ hàng", "Thêm giỏ hàng thất bại",
          icon: const Icon(Icons.person, color: Colors.white),
          backgroundColor: colorRatingStar,
          snackPosition: SnackPosition.TOP,
        );
      }
    }catch(e){
      SecureStorage secureStorage = SecureStorage();
      secureStorage.deleteAccessToken();
      secureStorage.deleteRefreshToken();
      Get.toNamed(Routes.authentication);
    }

  }

}