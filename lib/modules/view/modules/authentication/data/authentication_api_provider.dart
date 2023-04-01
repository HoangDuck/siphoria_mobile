import 'package:get/get.dart';

import '../../home/domain/entities/province_model.dart';

abstract class IAuthenticationProvider {

}

class AuthenticationProvider extends GetConnect{
  @override
  void onInit() {
    httpClient.baseUrl = 'https://hotels4.p.rapidapi.com';
    super.onInit();
  }
}