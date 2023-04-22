
import 'package:final_project_hcmute/modules/view/modules/authentication/data/authentication_api_provider.dart';
import 'package:final_project_hcmute/modules/view/modules/authentication/domain/entities/token_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/country_model.dart';
import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_category_model.dart';

import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/hotel_model.dart';

import 'package:final_project_hcmute/modules/view/modules/home/domain/entities/province_model.dart';

import '../domain/adapters/repository_adapter.dart';


class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository({required this.provider});
  final IAuthenticationProvider provider;

  @override
  Future<TokenModel> signIn(String username, String password) async {
    final response = await provider.signIn(username, password);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }

}