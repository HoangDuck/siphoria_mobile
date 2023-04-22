import 'package:final_project_hcmute/core/services/api_constant.dart';
import 'package:get/get.dart';

import '../../home/domain/entities/province_model.dart';
import '../domain/entities/token_model.dart';

abstract class IAuthenticationProvider {
  Future<Response<TokenModel>> signIn(String username, String password);
}

class AuthenticationProvider extends GetConnect
    implements IAuthenticationProvider {
  @override
  void onInit() {
    httpClient.baseUrl =baseUrl;
    super.onInit();
  }

  @override
  Future<Response<TokenModel>> signIn(String username, String password) {
    // TODO: implement signIn
    httpClient.defaultDecoder = httpClient.defaultDecoder =
        (value) => TokenModel.fromJson(value['data'] as Map<String, dynamic>);
    return post(loginUrl, {"email": username, "password": password});
  }
}
