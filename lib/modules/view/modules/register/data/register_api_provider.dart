

import 'package:get/get.dart';

import '../../../../../core/services/api_constant.dart';
import '../../authentication/domain/entities/token_model.dart';

abstract class IRegisterProvider {
  Future<Response<TokenModel>> signUp(String email, String password,String firstName, String lastName);
}

class RegisterProvider extends GetConnect
    implements IRegisterProvider {
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    super.onInit();
  }
  @override
  Future<Response<TokenModel>> signUp(String email, String password, String firstName, String lastName) async {
    // TODO: implement sign
    httpClient.defaultDecoder = httpClient.defaultDecoder =
        (value) => TokenModel.fromJson(value['data'] as Map<String, dynamic>);
    return await post(registerUrl, {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
      "fcm_key": ""
    });
  }

}
