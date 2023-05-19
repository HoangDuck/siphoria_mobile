import 'package:get/get.dart';

import '../../../../../core/services/api_constant.dart';
import '../../home/presentations/controllers/home_controller.dart';
import '../domain/entities/payment_model.dart';

abstract class IPaymentProvider {
  Future<Response<List<PaymentModel>>> getListPaymentMobile();
  Future<Response<bool>> updatePayment(String sessionId);
}

class PaymentProvider extends GetConnect implements IPaymentProvider{
  @override
  Future<Response<List<PaymentModel>>> getListPaymentMobile() {
    HomeController controller = Get.find<HomeController>();
    // TODO: implement getListPaymentMobile
    httpClient.baseUrl =baseUrl;
    httpClient.defaultDecoder = (value){
      return paymentModelFromJson(value);
    };
    return get(getListPaymentUrl,headers: {
      'Authorization':'Bearer ${controller.accessToken}'
    });
  }

  @override
  Future<Response<bool>> updatePayment(String sessionId) {
    HomeController controller = Get.find<HomeController>();
    // TODO: implement updatePayment
    httpClient.baseUrl =baseUrl;
    httpClient.defaultDecoder = httpClient.defaultDecoder = (value) => resultBoolDeCode(value);
    return put(getListPaymentUrl,{
      'session_id': sessionId
    },headers: {
      'Authorization':'Bearer ${controller.accessToken}'
    });
  }


  bool resultBoolDeCode(dynamic data){
    return data['data'].toString().toLowerCase()=='true';
  }

}