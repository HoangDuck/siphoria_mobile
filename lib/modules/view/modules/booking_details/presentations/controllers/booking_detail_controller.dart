
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../payment_module/domain/entities/payment_model.dart';

class BookingDetailController extends GetxController{

  late PaymentModel paymentData;
  final format = DateFormat('yyyy-MM-dd HH:mm:ss.sssZ','en-US');

  calculateDayRatePackage(DateTime dateTime){
    return '${dateTime.day} Tháng ${dateTime.month}, ${dateTime.year}';
  }

  @override
  void onInit() {
    super.onInit();
    paymentData=Get.arguments;
    refresh();
  }
}