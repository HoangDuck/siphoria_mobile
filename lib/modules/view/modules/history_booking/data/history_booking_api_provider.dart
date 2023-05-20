
import 'package:get/get.dart';

import '../../../../../core/services/api_constant.dart';
import '../../home/presentations/controllers/home_controller.dart';
import '../../payment_module/domain/entities/payment_model.dart';

abstract class IHistoryBookingProvider {
  Future<Response<List<PaymentModel>>> getListPaymentMobile();
}


class HistoryBookingProvider extends GetConnect implements IHistoryBookingProvider{
  @override
  Future<Response<List<PaymentModel>>> getListPaymentMobile() {
    HomeController controller = Get.find<HomeController>();
    // TODO: implement getListPaymentMobile
    httpClient.baseUrl =baseUrl;
    httpClient.defaultDecoder = (value){
      return paymentModelFromJson(value);
    };
    return get(getListPaymentHistoryUrl,headers: {
      'Authorization':'Bearer ${controller.accessToken}'
    });
  }

  bool resultBoolDeCode(dynamic data){
    return data['data'].toString().toLowerCase()=='true';
  }

}