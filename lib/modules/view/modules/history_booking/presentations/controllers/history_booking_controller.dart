
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/services/local_storage.dart';
import '../../../../../../routers/page_routes.dart';
import '../../../payment_module/domain/entities/payment_model.dart';
import '../../domain/adapters/repository_adapter.dart';

class HistoryBookingController extends GetxController{
  final IHistoryBookingRepository historyBookingRepository;

  HistoryBookingController({required this.historyBookingRepository});
  RxList<PaymentModel> listPayment= <PaymentModel>[].obs;

  final format = DateFormat('yyyy-MM-dd HH:mm:ss.sssZ','en-US');

  @override
  void onInit() {
    super.onInit;
    getListPaymentModel();
  }

  calculateDayRatePackage(DateTime dateTime){
    return '${dateTime.day} Tháng ${dateTime.month}, ${dateTime.year}';
  }

  getPaymentStatus(String value){
    var tempValueStatus = "";
    switch(value){
      case "pending":
        tempValueStatus = "Chờ thanh toán";
        break;
      case "paid":
        tempValueStatus = "Đã thanh toán";
        break;
      case "cancel":
        tempValueStatus  = "Đã huỷ";
        break;
      case "refunded":
        tempValueStatus  = "Đã hoàn tiền";
        break;
      case "checked":
        tempValueStatus = "Đã check in";
        break;
    }
    return tempValueStatus;
  }

  getListPaymentModel() async {
    listPayment.clear();
    try{
      var listPaymentModel = await historyBookingRepository.getListPayment();
      if(listPaymentModel.isNotEmpty){
        listPayment.addAll(listPaymentModel);
        listPayment.refresh();
        // for (var element in listPaymentModel) {
        //   listHotelPayment.add('${element.hotel.id}#${element.hotel.name}');
        // }
        // var tempNewHotelList = listHotelPayment.toSet().toList();
        // listHotelPayment.clear();
        // listHotelPayment.addAll(tempNewHotelList);
        // listHotelPayment.refresh();
      }
    }catch(e){
      SecureStorage secureStorage = SecureStorage();
      secureStorage.deleteAccessToken();
      secureStorage.deleteRefreshToken();
      Get.offAndToNamed(Routes.authentication);
    }
  }
}